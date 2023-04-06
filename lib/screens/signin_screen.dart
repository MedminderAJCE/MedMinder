import 'package:flutter/material.dart';
import 'package:login/reusable_widgets/reusable_widgets.dart';
import 'package:login/screens/sample.dart';
import 'package:login/screens/signup.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  TextEditingController nameText=TextEditingController();
  TextEditingController passwordText =TextEditingController();
  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(top: 10),
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
                const SizedBox(height: 25),
                const Center(
                    child: Text(
                  "Welcome!",
                  style: TextStyle(fontSize: 45, color: Colors.white),
                )),
                const SizedBox(height: 30),
                const Text("Log in",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35, color: Colors.white)),
                const SizedBox(height: 40),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0)),
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(controller: nameText,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_outlined),
                          hintText: "Username",
                          hintStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                      ),
                          
                    )),
                const SizedBox(height: 40),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0)),
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(controller: passwordText,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                          )),
                    ),
                

                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>sample()));},
                    child: const Text("Forgot Password?",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(width: 120,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {},
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.blue),
                      )),
                ),
                const SizedBox(height: 70),
                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));}, child: const Text("Don't have an account? Sign Up",style: TextStyle(color: Colors.white),)),

              ],
            ),
          )),
    );
  }
}
