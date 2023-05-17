import 'package:flutter/material.dart';


//need to change the content according to the data . for a new user home includes :Add your medicine schedules .Later after adding details , they need to be viewed  



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children:[Text(" Add your medicine schedules",
        style: TextStyle(
          fontFamily: 'Railway',
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),),
          ]
      ),
      ),
    );
  }
}