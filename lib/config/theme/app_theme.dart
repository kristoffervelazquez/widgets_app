import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.purple,
  Colors.indigo,
  Colors.indigoAccent,
  Colors.deepOrange
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme:  const AppBarTheme(
          centerTitle: false,
          // backgroundColor: colorList[selectedColor],
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorList[selectedColor],
        ),
      );
}
