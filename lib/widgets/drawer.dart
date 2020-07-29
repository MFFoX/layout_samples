import 'package:flutter/material.dart';
import 'package:layout_samples/common/navigation-util.dart';
import 'package:layout_samples/pages/form.dart';
import 'package:layout_samples/pages/home-page.dart';
import 'package:layout_samples/pages/non-scrolling-page.dart';
import 'package:layout_samples/pages/tabbed-list-page.dart';
import 'package:layout_samples/routes/routes.dart';

class AppDrawer extends StatelessWidget {

  String getCurrentRouteName(context) {
    String currentRouteName;

    Navigator.popUntil(context, (route) {
      currentRouteName = route.settings.name;
      return true;
    });

    return currentRouteName;
  }

  Widget _createHeader() {

    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('assets/city-mountains.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Layouts",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(BuildContext context, {IconData icon, String text, String route, GestureTapCallback onTap}) {
    final currentRoute = getCurrentRouteName(context);
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
      selected: currentRoute == route,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = getCurrentRouteName(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(context, icon: Icons.home, text: 'Home', route: Routes.home,
              onTap: () {
                if(currentRoute == Routes.home) return;
                context.navigateTo(HomePage());
              }
            ),
          _createDrawerItem(context, icon: Icons.aspect_ratio, text: 'Non-Scrolling', route: Routes.nonScrolling,
              onTap: () {
                if(currentRoute == Routes.nonScrolling) return;
                context.navigateTo(NonScrollingPage());
              }
          ),
          _createDrawerItem(context, icon: Icons.view_list, text: 'Tabbed List', route: Routes.tabbedList,
              onTap: () {
                if(currentRoute == Routes.tabbedList) return;
                context.navigateTo(TabbedListPage());
              }
          ),
          _createDrawerItem(context, icon: Icons.keyboard, text: 'Form', route: Routes.form,
              onTap: () {
                if(currentRoute == Routes.form) return;
                context.navigateTo(FormPage());
              }
          ),
          Divider(),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},

          ),
        ],
      ),
    );
  }
}
