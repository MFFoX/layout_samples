import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:layout_samples/widgets/app-bar.dart';
import 'package:layout_samples/widgets/drawer.dart';

class TabbedListPage extends StatelessWidget {
  static const String routeName = '/tabbed-list';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: appBar("Tabbed List"),
        drawer: AppDrawer(),
        body: Center(child: Text("TabbedListPage")));
  }
}