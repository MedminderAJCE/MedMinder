import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  User? user = FirebaseAuth.instance.currentUser;
  late Stream<DocumentSnapshot<Map<String, dynamic>>> dataStream = FirebaseFirestore.instance
      .collection('Users')
      .doc(user?.email)
      .snapshots()
      .map((doc) => doc as DocumentSnapshot<Map<String, dynamic>>);

  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var userDetails =
    FirebaseFirestore.instance.collection('Users').doc(user?.email);
    dataStream = userDetails.snapshots().map((doc) => doc as DocumentSnapshot<Map<String, dynamic>>);
  }

  @override
  Widget build(BuildContext context) {
    String? email = user?.email;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.cyan.withOpacity(0.1),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                          color: Colors.cyan,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: dataStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final data = snapshot.data?.data();
                    if (data != null) {
                      return Column(
                        children: [
                          buildTextField(
                            labelText: "Name",
                            placeholder: data['username'],
                          ),
                          buildTextField(
                            labelText: "Age",
                            placeholder: data['age'],
                          ),
                          buildTextField(
                            labelText: "Mobile Number",
                            placeholder: data['phone'],
                          ),
                          buildTextField(
                            labelText: "Email",
                            placeholder: email.toString(),
                          ),
                          // Rest of your code
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Edit Profile",
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Text('No data available');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buildTextField extends StatefulWidget {
  String labelText;
  String placeholder;
  bool isPasswordTextField;
  bool isobscureText;

  buildTextField({
    this.labelText = "",
    this.isPasswordTextField = false,
    this.isobscureText = true,
    this.placeholder = "",
    Key? key,
  }) : super(key: key);

  @override
  State<buildTextField> createState() => _buildTextFieldState();
}

class _buildTextFieldState extends State<buildTextField> {
  bool isobscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: widget.isPasswordTextField ? isobscureText : false,
        decoration: InputDecoration(
          suffixIcon: widget.isPasswordTextField
              ? IconButton(
            onPressed: () {
              setState(() {
                isobscureText = !isobscureText;
              });
            },
            icon: Icon(isobscureText ? Icons.visibility_off : Icons.visibility),
          )
              : null,
          contentPadding: const EdgeInsets.only(bottom: 5),
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.cyan,
          ),
        ),
      ),
    );
  }
}
