import 'package:flutter/material.dart';

import 'pages/first screen.dart';

void main() => runApp(
    MaterialApp(
     theme: ThemeData.dark().copyWith(
       primaryColor: Color(0xFF090C22),
       scaffoldBackgroundColor: Color(0xFF090C22),
       appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF090C22),
       )
     ),
  debugShowCheckedModeBanner: false,
  title: "BMI CALCULATOR",
     home: HomePage(),

));
