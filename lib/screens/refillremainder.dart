import 'package:flutter/material.dart';
import 'package:login/screens/account.dart';

class refillremainder extends StatefulWidget {
  const refillremainder({super.key});

  @override
  State<refillremainder> createState() => _refillremainderState();
}

class _refillremainderState extends State<refillremainder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: SizedBox(
          width: 300,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Total number  of medicines ",
                    // labelStyle: const TextStyle(color: Color(0xFF00E5FF) ),
                    focusColor: const Color(0xFF00E5FF),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                  ),
                ),
                Container(
                  height: 30,
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Total quantity left",
                    // labelStyle: const TextStyle(color: Color(0xFF00E5FF) ),
                    focusColor: const Color(0xFF00E5FF),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                  ),
                ),
                Container(
                  height: 20,
                ),

                //backend
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const refillremainder()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320.0, 50.0),
                    backgroundColor: const Color(0xFF00E5FF),
                  ),
                  child: const Text('Send Notification',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
