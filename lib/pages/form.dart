import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:layout_samples/widgets/drawer.dart';

class FormPage extends StatelessWidget {
  static const String routeName = '/form';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("FormPage")));
  }
}