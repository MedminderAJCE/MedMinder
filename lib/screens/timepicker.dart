import 'package:flutter/material.dart';

class timepicker extends StatefulWidget {
  const timepicker({Key? key}) : super(key: key);

  @override
  State<timepicker> createState() => _timepickerState();
}

class _timepickerState extends State<timepicker> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  void _showTimePicker() {
    showTimePicker(context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay= value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF6096B4),
              Color(0xFF51B9CD),
              Color(0xFF00E5FF),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(_timeOfDay.format(context).toString(),
              style: TextStyle(fontSize: 50,color: Colors.white),
            ),
            MaterialButton(
              onPressed: _showTimePicker,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("PICK TIME",
                    style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25)),
              ),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
