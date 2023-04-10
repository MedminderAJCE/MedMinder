import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/reusable_widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/homepage.dart';
import 'package:login/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

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
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Column(
            children: <Widget>[
              const Text("Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 40,
              ),
              reusableTextField("Username", Icons.person_outline, false,
                  _usernameTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Age", Icons.calendar_month, false, _ageTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Phone", Icons.phone, false, _phoneTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Email", Icons.mail, false, _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Password", Icons.lock, true, _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      Signup(
                          age: _ageTextController.text,
                          phone: _phoneTextController.text,
                          username: _usernameTextController.text,
                          email: _emailTextController.text,
                          password: _passwordTextController.text);
                          User? user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const HomePage()));
                      }
                    },
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignScreen()));
                  },
                  child: const Text(
                    "Already have an account? Log In",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}

Future Signup(
    {required String email,
    required String password,
    required String age,
    required String phone,
    required String username}) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    String error = e.message.toString();
    if(error == "Given String is empty or null"){Fluttertoast.showToast(msg: "Please enter the details");}
    else Fluttertoast.showToast(msg: error);
  }
  await FirebaseFirestore.instance
      .collection("Users")
      .doc(email)
      .set({'username': username, 'age': age, 'phone': phone});
}
