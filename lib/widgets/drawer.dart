import 'package:flutter/material.dart';
import 'package:layout_samples/common/navigation-util.dart';
import 'package:layout_samples/pages/form.dart';
import 'package:layout_samples/pages/home-page.dart';
import 'package:layout_samples/pages/non-scrolling-page.dart';
import 'package:layout_samples/pages/tabbed-list-page.dart';

class AppDrawer extends StatelessWidget {
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

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.home, text: 'Home',
              onTap: () => context.navigateTo(HomePage())),
          _createDrawerItem(icon: Icons.aspect_ratio, text: 'Non-Scrolling', 
              onTap: () => context.navigateTo(NonScrollingPage())),
          _createDrawerItem(icon: Icons.view_list, text: 'Tabbed List',
              onTap: () => context.navigateTo(TabbedListPage())),
          _createDrawerItem(icon: Icons.keyboard, text: 'Form',
              onTap: () => context.navigateTo(FormPage())),
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
