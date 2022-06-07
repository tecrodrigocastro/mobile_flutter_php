import 'package:flutter/material.dart';
import 'package:mobile_flutter_php/external/server_handler.dart';
import 'package:mobile_flutter_php/screens/product_details.dart';
import 'package:mobile_flutter_php/screens/product_screen.dart';
import 'package:mobile_flutter_php/screens/sellers_screen.dart';
import 'package:mobile_flutter_php/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        SellersScreen.routeName: (_) => const SellersScreen(),
        ProductScreen.routeName: (_) => const ProductScreen(),
        ProductScreenDetails.routeName: (_) => const ProductScreenDetails(),
      },
    );
  }
}
