import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yalla_kora/pages/tab_par_data1.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Home Screen after 3 seconds
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TabBarAll()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Image.asset('assets/splash.png',
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 1),
      ),
    );
  }
}
