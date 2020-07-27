import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_samples/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final String title;
  HomePage({Key key, this.title = "Sample Layouts"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        drawer: AppDrawer()
    );
  }
}