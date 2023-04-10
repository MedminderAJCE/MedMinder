import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/screens/homepage.dart';
import 'package:login/screens/forgetpassword.dart';
import 'package:login/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  TextEditingController nameText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF6096B4),
                Color(0xFF51B9CD),
                Color(0xFF00E5FF),
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 35),
                  const Center(
                      child: Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 45, color: Colors.white),
                  )),
                  const SizedBox(height: 50),
                  const Text("Log in",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white)),
                  const SizedBox(height: 60),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: TextFormField(
                        controller: nameText,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail, size: 25),
                          hintText: "Email",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      )),
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0)),
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                        controller: passwordText,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          hintText: "Password",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          border: InputBorder.none,
                        )),
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Forgetpassword()));
                      },
                      child: const Text("Forgot Password?",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Signin(
                              email: nameText.text,
                              password: passwordText.text);
                          User? user = _auth.currentUser;
                          if (user!=null) {
                            print("test passed");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                          print("test2 passed");
                        },
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )),
                  ),
                  const SizedBox(height: 70),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const signup()));
                      },
                      child: const Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            )),
      ),
    );
  }
}

Future Signin({String email = "", String password = ""}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    String error = e.message.toString();
    if (error == "Given String is empty or null") {
      Fluttertoast.showToast(msg: "Please enter the details");
    } else
      Fluttertoast.showToast(msg: error);
  }
}
