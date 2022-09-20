import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:noteapp/model/constant/color/colors.dart';
import 'package:noteapp/view/home_screen/home.dart';
import 'package:noteapp/view/splash_screen/widget/animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _a = false;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 700),
      () {
        setState(
          () {
            _a = !_a;
          },
        );
      },
    );
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          SlideTransitionAnimation(
            const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _a ? width : 0,
            height: height,
            color: Colors.white,
          ),
          Center(
            child: Image.asset('asset/image/bosc.png'),
          ),
        ],
      ),
    );
  }
}
