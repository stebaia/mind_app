import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeHelper {
  static const backgroundColorWhite = Color(0xffF5F1FF);
  static const colorSemiWhite = Color.fromARGB(255, 239, 234, 251);
  static const backgroundColorDark = Color(0xff262329);
  static const disabledColor = Color.fromARGB(255, 137, 132, 132);
  static const transparentGray = Color.fromARGB(208, 255, 255, 255);
  static const mainColor = Color(0xffA594FF);
  static const secondaryColor = Color(0xffCEB6F3);
  static const drawingColor = Color(0xffC4CDFF);
  static const buttonColor = Color.fromARGB(255, 123, 97, 185);
  static const buttonSecondaryColor = Color.fromARGB(255, 49, 38, 110);
  static const backgroundColorDarkLogin = Color.fromARGB(234, 45, 1, 99);
}
class DarkThemePreferences {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
