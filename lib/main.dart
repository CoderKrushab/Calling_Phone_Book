import 'dart:async';

import 'package:calling_app/Screen/contactdetails.dart';
import 'package:calling_app/Screen/insertpage.dart';
import 'package:calling_app/Screen/splash.dart';
import 'package:calling_app/Screen/updatepage.dart';
import 'package:calling_app/Screen/viewpage.dart';
import 'package:flutter/material.dart';
import 'Variables/variables.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(const Duration(microseconds: 100), (time) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            color: Colors.black45,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.lightBlueAccent,
          foregroundColor: Colors.white,
        ),
      ),

      //-----------dark theme-------------//
      darkTheme: ThemeData(
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            color: Colors.white54,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.lightBlueAccent,
          foregroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        brightness: Brightness.dark,
      ),
      themeMode: (themecolorbool) ? ThemeMode.light : ThemeMode.dark,
      routes: {
        "/": (context) => const splash(),
        "view_page": (context) => const viewpage(),
        "insert_page": (context) => const insertpage(),
        "contact_details": (context) => const contactdetails(),
        "update_page": (context) => const updatepage(),
      },
    );
  }
}
