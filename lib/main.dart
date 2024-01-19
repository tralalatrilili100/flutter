// ignore_for_file: use_key_in_widget_constructors

import 'package:basketapp/screens/drh_screen.dart';
import 'package:basketapp/screens/dribbling_screen.dart';
import 'package:basketapp/screens/esai_screen.dart';
import 'package:basketapp/screens/home_screen.dart';
import 'package:basketapp/screens/passing_screen.dart';
import 'package:basketapp/screens/pembelajaran_screen.dart';
import 'package:basketapp/screens/pilber_screen.dart';
import 'package:basketapp/screens/shooting_screen.dart';
import 'package:basketapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      routes: {
        'home_screen': (context) => HomePage(),
        'pembelajaran_screen': (context) => PembelajaranScreen(),
        'passing_screen': (context) => PassingScreen(),
        'dribbling_screen': (context) => DribblingScreen(),
        'shooting_screen': (context) => ShootingScreen(),
        'esai_screen': (context) => EsaiScreen(),
        'pilber_screen': (context) => PilberScreen(),
        'drh_screen': (context) => DrhScreen(),
      },
    );
  }
}
