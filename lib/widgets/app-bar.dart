import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String title, {Color backgroundColor, Color textColor}) {

  var flexImage = backgroundColor == null
    ? Image(image: AssetImage('assets/clouds.jpg'), fit: BoxFit.cover)
    : null;

  return AppBar(
    centerTitle: true,
    title: Text(title, style: TextStyle(color: textColor != null ? textColor : Colors.white)),
    flexibleSpace: flexImage,
    backgroundColor: backgroundColor != null ? backgroundColor : Colors.transparent,
  );
}

