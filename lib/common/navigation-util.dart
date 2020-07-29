import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void navigateTo(Widget page){
    Navigator.of(this).pop();
    Navigator.of(this)
        .push(MaterialPageRoute(builder: (BuildContext context) => page));
  }

  void navigateToNamed(String route){
    Navigator.of(this).pop();
    Navigator.pushReplacementNamed(this, route);
  }
}

