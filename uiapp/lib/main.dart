import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uiapp/Screens/cart_screen.dart';
import 'package:uiapp/Screens/intro_screen.dart';
import 'package:uiapp/Screens/payments_screen.dart';
import 'package:uiapp/models/Shop_models.dart';
import 'package:uiapp/models/payments_models.dart';

import 'Screens/menu_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ShopModels())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
      routes: {
        '/intro_screen': (context) => const IntroScreen(),
        '/menu_screen': (context) => const MenuScreen(),
        '/cart_screen': (context) => const CartScreen(),
        '/payment_screen': (context) => const PaymentScreen(),
      },
    );
  }
}
