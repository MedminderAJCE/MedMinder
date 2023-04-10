import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login/screens/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignScreen()));
    });
  }

  Color TextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
        child: Container(
            color: const Color(0xff5ac7cf),
            height: MediaQuery.of(context).size.height,
            child:
            const Image(image: AssetImage("assets/images/logo.png")))));
  }
}
