import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.lightBlue,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          )
        ),
        scaffoldBackgroundColor: Colors.lightBlue[300],
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey
          ),
          labelSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white
          )
        )
      ),
    );
  }
}