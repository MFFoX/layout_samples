import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String title) {
  return AppBar(
    title: Text(title),
    flexibleSpace: Image(
      image: AssetImage('assets/clouds.jpg'),
      fit: BoxFit.cover,
    ),
    backgroundColor: Colors.transparent,
  );
}

