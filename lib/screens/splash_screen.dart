import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter_php/screens/sellers_screen.dart';
import 'package:mobile_flutter_php/external/server_handler.dart';
import 'package:mobile_flutter_php/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLoadingSellers = false;
  dynamic _timer;

  void getSellers() {
    ServerHandler()
        .getSellers()
        .then((value) => Navigator.of(context)
            .popAndPushNamed(SellersScreen.routeName, arguments: value))
        .catchError((e) => print(e));
  }

  @override
  void initState() {
    super.initState();

    _timer = new Timer(
        const Duration(seconds: 3),
        () => {
              showLoadingSellers = true,
              setState(() {}),
              getSellers(),
            });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xffe6f3ec),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Better Buys",
              style: GoogleFonts.pacifico(color: primaryColor, fontSize: 30),
            ),
            if (showLoadingSellers)
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  strokeWidth: 1.5,
                ),
              ),
            if (showLoadingSellers)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "Loading Sellers",
                  style: GoogleFonts.poppins(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
