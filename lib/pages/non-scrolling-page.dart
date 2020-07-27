import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:layout_samples/widgets/drawer.dart';

class NonScrollingPage extends StatelessWidget {
  static const String routeName = '/non-scrolling';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Non-scrolling"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("NonScrollingPage")));
  }
}