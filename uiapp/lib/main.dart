import 'package:flutter/material.dart';
import 'package:uiapp/Screens/intro_screen.dart';

import 'Screens/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: IntroScreen(),
      routes: {
      '/intro_screen': (context) => const IntroScreen(),
       '/menu_screen': (context) => const MenuScreen(),
      },

    );
  }
}
