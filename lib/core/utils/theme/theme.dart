import 'package:flutter/material.dart';




class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: Colors.grey,
    brightness: Brightness.light,
    primaryColor: Colors.green[900],
    indicatorColor: Colors.green[900],
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.black,
      secondary: Color(0XFFFAFAFA),
    ),
  );



  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      disabledColor: Colors.grey,
      brightness: Brightness.dark,
      primaryColor: Colors.green[900],
      indicatorColor:Colors.green[900],
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.light(
      primary:Colors.grey,
      secondary: Colors.black,
        brightness: Brightness.dark,

    ),
  );


}