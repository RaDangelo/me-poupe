import 'package:flutter/material.dart';

class MainTheme {
  ThemeData get themeData {
    return ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent,
        textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w600))),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.white, backgroundColor: Colors.teal));
  }
}
