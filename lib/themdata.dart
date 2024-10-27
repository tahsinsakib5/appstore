import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 1,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[900]),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.grey[800]),
      ),
    );
  }
}
