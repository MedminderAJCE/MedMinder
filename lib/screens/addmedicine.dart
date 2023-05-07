import 'package:flutter/material.dart';
import 'package:login/screens/setalarm.dart';

class AddMedicine extends StatelessWidget {
  const AddMedicine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Medicine Name",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFF00E5FF),
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFF00E5FF),
                      )),
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  const TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter Medicine Dosage",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFF00E5FF),
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFF00E5FF),
                      )),
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Medicine Course",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFF00E5FF),
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFF00E5FF),
                      )),
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Quantity Left',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(320.0, 50.0),
                      backgroundColor: const Color(0xFF00E5FF),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const setalarm()));
                    },
                    child: const Text('Set Alarm',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(320.0, 50.0),
                        backgroundColor: const Color(0xFF00E5FF)),
                  ),
                ],
              ))),
    );
  }
}
