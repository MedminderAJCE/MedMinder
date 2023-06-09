import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/screens/homepage.dart';
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
  TextEditingController PasswordResetEmail = TextEditingController();
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
                Color(0xff5ac7cf),
                Color(0xFF51B9CD),
                Color(0xFF00E5FF),
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 45),
                   Container(
                     padding: const EdgeInsets.only(top: 60),
                      child: const Text(
                    "Welcome Back!",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 35, color: Colors.white),
                  )),
                  const SizedBox(height: 15),
                  const Text("Login to Continue",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white)),
                  const SizedBox(height: 70),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: TextFormField(
                        controller: nameText,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail, size: 25,color: Colors.grey),
                          hintText: "Email",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      )),
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0)),
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                        obscureText: true,
                        controller: passwordText,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          hintText: "Password",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.grey,),
                          border: InputBorder.none,
                        )),
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                                elevation: 0.0,
                                title: const Text("Reset the Password",style: TextStyle(color: Colors.grey),),
                                actions: [
                                  TextFormField(
                                    controller: PasswordResetEmail,
                                    decoration: const InputDecoration(
                                        hintText: "Enter the Email",hintStyle: TextStyle(color: Colors.grey)),

                                  ),
                                  IconButton(onPressed: () async{
                                    try {
                                      await FirebaseAuth.instance.sendPasswordResetEmail(
                                          email: PasswordResetEmail.text);
                                          Navigator.of(context).pop();
                                    }catch(e){
                                      print("test passed");
                                      String Error = e.toString();
                                      if (Error == "[firebase_auth/unknown] Given String is empty or null") {
                                        Fluttertoast.showToast(msg: "Please Enter the Email");
                                      }
                                      else
                                      Fluttertoast.showToast(msg: Error);
                                    }


                                  }, icon: Icon(Icons.check),color: Colors.grey,)
                                ],
                              );
                            });

                      },
                      child: const Text("Forgot Password?",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          Signin(
                              email: nameText.text,
                              password: passwordText.text);
                          User? user = _auth.currentUser;
                          await user?.reload();
                          user = _auth.currentUser;
                          if (user?.email == nameText.text && user?.emailVerified == true) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                          else if (user?.email == nameText.text) {
                            Fluttertoast.showToast(msg: "Sorry, your email has not been verified yet. Please try again!");
                            user?.reload();
                          }
                        },
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(
                            color: Color(0xff5ac7cf) ,
                            fontWeight: FontWeight.bold,
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
      Fluttertoast.showToast(msg: "Please Enter the details");
    } else
      Fluttertoast.showToast(msg: error);
  }
}
