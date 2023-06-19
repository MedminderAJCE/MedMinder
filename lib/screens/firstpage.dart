import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Caretaker extends StatefulWidget {
  const Caretaker({Key? key}) : super(key: key);

  @override
  State<Caretaker> createState() => _CaretakerState();
}

class _CaretakerState extends State<Caretaker> {
  late CollectionReference _caretakerCollection;
  TextEditingController nameText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController phoneText = TextEditingController();

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
                    addCaretakerDetails(
                      name: nameText.text,
                      email: emailText.text,
                      phone: phoneText.text,
                    );
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
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final document = documents[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        document['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(document['phone number']),
                    ],
                  ),
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

  Future<void> addCaretakerDetails({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("Care Taker").doc(email).set({
        'name': name,
        'phone number': phone,
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Error"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: Caretaker(),
  ));
}
