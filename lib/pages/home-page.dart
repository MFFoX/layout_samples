import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_samples/widgets/app-bar.dart';
import 'package:layout_samples/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final String title;
  static const String routeName = '/';

  HomePage({Key key, this.title = "Sample Layouts"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title),
        drawer: AppDrawer()
    );
  }
}