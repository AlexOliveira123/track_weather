import 'package:flutter/material.dart';
class ThemeApp {
  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'Google',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color(0xffea6e4b),
      accentColor: Color(0xffea6e4b),
      buttonColor: Color(0xff505050),
      cursorColor: Color(0xffea6e4b),
      buttonTheme: ButtonThemeData(
        height: 50,
        minWidth: double.infinity,
        buttonColor: Color(0xff505050),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        textTheme: ButtonTextTheme.primary
      ),
    );
  }

}