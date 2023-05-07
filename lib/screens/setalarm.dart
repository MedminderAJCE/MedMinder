import 'package:flutter/material.dart';
import 'package:login/screens/clockview.dart';
class setalarm extends StatefulWidget {
  const setalarm({Key? key}) : super(key: key);

  @override
  State<setalarm> createState() => _setalarmState();
}

class _setalarmState extends State<setalarm> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return Scaffold(
      body: Container(
        padding:EdgeInsets.all(32),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF6096B4),
            Color(0xFF51B9CD),
            Color(0xFF00E5FF),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Column(
    children: <Widget> [
      Text('Clock',style: TextStyle(color: Colors.white,fontSize: 24),),
    clockview(),
    ],

      ),
    ),
    );
  }
}
