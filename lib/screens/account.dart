import 'package:flutter/material.dart';
class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: (){
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
                            color: Colors.cyan.withOpacity(0.1)
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
                          border: Border.all(
                            width: 4,
                            color: Colors.white
                          ),
                          color: Colors.cyan

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
              buildTextField(labelText: "Name"),
              buildTextField(labelText: "Age"),
              buildTextField(labelText: "Mobile Number"),
              buildTextField(labelText: "Email"),
              buildTextField(labelText: "Password",isPasswordTextField: true),
              const SizedBox(height: 10),
              SizedBox(
                width: 20,

                child:
                ElevatedButton(onPressed: (){},
                    child:
                  const Text("Edit Profile",
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.white
                  ),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),)
              )
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

  buildTextField({this.labelText = "",
    this.isPasswordTextField = false,
    this.isobscureText = true,
    this.placeholder = "",
    Key? key})
      : super(key: key);

  @override
  State<buildTextField> createState() => _buildTextFieldState();
}

class _buildTextFieldState extends State<buildTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: widget.isobscureText,
        decoration: InputDecoration(
            suffixIcon: widget.isPasswordTextField
                ? IconButton(onPressed: () {setState(() {
              widget.isobscureText = !widget.isobscureText;
            });},
                icon: Icon(widget.isobscureText ? Icons.visibility_off:Icons.visibility))
                : null,
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: widget.labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget.placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
            )),
      ),
    );
  }
}