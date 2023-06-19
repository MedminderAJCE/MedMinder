import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // User not logged in
      return Scaffold(
        body: Center(
          child: Text(
            'User not logged in',
            style: TextStyle(
              fontFamily: 'Railway',
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Medications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Medications')
            .doc(user.email)
            .collection('Medicines')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          if (documents.isEmpty) {
            // No medications found
            return Center(
              child: Text(
                'No medications found',
                style: TextStyle(
                  fontFamily: 'Railway',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final medication = documents[index].data() as Map<String, dynamic>;
              final medicationName = medication['medicationName'];
              final dosage = medication['dosage'];
              final alarmTime = medication['alarmTime'];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            medicationName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Dosage: $dosage',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Alarm Time: $alarmTime',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // Delete medication entry
                          FirebaseFirestore.instance
                              .collection('Medications')
                              .doc(user.email)
                              .collection('Medicines')
                              .doc(documents[index].id)
                              .delete()
                              .then((value) {
                            print('Medication deleted successfully');
                          }).catchError((error) {
                            print('Failed to delete medication: $error');
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
