import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String title, {Color backgroundColor}) {

  var flexImage = backgroundColor == null
    ? Image(image: AssetImage('assets/clouds.jpg'), fit: BoxFit.cover)
    : null;

  return AppBar(
    title: Text(title),
    flexibleSpace: flexImage,
    backgroundColor: backgroundColor != null ? backgroundColor : Colors.transparent,
  );
}

