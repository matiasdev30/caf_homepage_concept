import 'dart:async';

import 'package:flutter/material.dart';
import 'package:caf_homepage_concept/const/const.dart';
import 'package:caf_homepage_concept/views/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 1200),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(imgCAF),
        ),
      ),
    );
  }
}
