import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColors{
  static const Color MidnightExpress = Color.fromRGBO(21, 21, 34, 1);
  static const Color LightSlateBlue = Color.fromRGBO(109, 126, 255, 1);
  static const Color LightSkyBlue = Color.fromRGBO(155, 166, 250, 1);
  static const Color Glacier = Color.fromRGBO(124, 186, 189, 1);
  static const Color DodgerBlue = Color.fromRGBO(0, 132, 244, 1);
  static const Color MayaBlue = Color.fromRGBO(78, 174, 255, 1);
  static const Color IconGray = Color.fromRGBO(142, 142, 147, 1);
}

class FontSizes {
  static double scale = 1;
  static double get body => 16 * scale;
  static double get bodySm => 11 * scale;
  static double get title => 34 * scale;
  static double get titleSm => 20 * scale;
}

class TextStyles {
  static TextStyle get bodyFont => GoogleFonts.roboto();
  static TextStyle get bodyLightFont => GoogleFonts.roboto(fontWeight: FontWeight.w300);
  static TextStyle get titleFont =>  GoogleFonts.roboto();

  static TextStyle get title => titleFont.copyWith(fontSize: FontSizes.title);
  static TextStyle get titleLight => title.copyWith(fontWeight: FontWeight.w300);

  static TextStyle get body => bodyFont.copyWith(fontSize: FontSizes.body, fontWeight: FontWeight.w300);
  static TextStyle get bodyLight => bodyLightFont.copyWith(fontSize: FontSizes.body);
  static TextStyle get bodySm => body.copyWith(fontSize: FontSizes.bodySm);
}

extension TextStyleHelpers on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get lightColor => copyWith(color: Colors.white);
  TextStyle get darkColor => copyWith(color: ThemeColors.MidnightExpress);

  TextStyle weight(FontWeight value) => copyWith(fontWeight: value);
  TextStyle size(double value ) => copyWith(fontSize: value);
  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
  TextStyle c(Color value) => copyWith(color: value);
}