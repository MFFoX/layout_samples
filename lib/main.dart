import 'package:flutter/material.dart';
import 'package:layout_samples/pages/home-page.dart';
import 'package:layout_samples/widgets/theme-data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Samples',
      theme: ThemeData(
        primaryColor: ThemeColors.LightSlateBlue,
        primaryColorDark: ThemeColors.MidnightExpress,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}