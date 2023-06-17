import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Caretaker extends StatefulWidget {
  const Caretaker({Key? key}) : super(key: key);

  @override
  State<Caretaker> createState() => _CaretakerState();
}

class _CaretakerState extends State<Caretaker> {
  TextEditingController nameText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  SnackBar snackBar = SnackBar(
    content: Text("enter the details completely"),
  );

  late CollectionReference _caretakerCollection;

  @override
  void initState() {
    super.initState();
    _caretakerCollection = FirebaseFirestore.instance.collection("Care Taker");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: const Text("Add caretaker details"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text("Caretaker details"),
              actions: [
                TextFormField(
                  controller: nameText,
                  decoration: const InputDecoration(hintText: "Name"),
                ),
                TextFormField(
                  controller: phoneText,
                  decoration: const InputDecoration(hintText: "Phone Number"),
                ),
                TextFormField(
                  controller: emailText,
                  decoration: const InputDecoration(hintText: "Email Address"),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.cyanAccent),
                  ),
                  onPressed: () {
                    AddCareTakerDetails(
                        name: nameText.text,
                        email: emailText.text,
                        PhnNumber: phoneText.text);
                  },
                  child: const Text(
                    "Done",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _caretakerCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final document = documents[index];
                // Build your list item using the document data
                return ListTile(
                  title: Text(document['name']),
                  subtitle: Text(document['phone number']),
                  // Add more widgets as needed
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Future<void> AddCareTakerDetails({
  required String name,
  required String email,
  required String PhnNumber,
}) async {
  try {
    await FirebaseFirestore.instance
        .collection("Care Taker")
        .doc(email)
        .set({'name': name, 'phone number': PhnNumber, 'email': email});
  } on FirebaseAuthException catch (e) {
    String Toast = e.message.toString();
    Fluttertoast.showToast(msg: Toast);
  }
}
