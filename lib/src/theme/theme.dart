import 'package:flutter/material.dart';

class MyTheme {
  static final myTheme = ThemeData.dark().copyWith(
    accentColor: Colors.redAccent,
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Poppins',
        ),
  );
}
