import 'package:flutter/material.dart';

class MainTheme {
  MainTheme();

  ThemeData get themeData {
    return ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.black26,
        accentColor: Colors.purple,
        textTheme: ThemeData.dark().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              button:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.dark().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w600))),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.white, backgroundColor: Colors.purple));
  }
}
