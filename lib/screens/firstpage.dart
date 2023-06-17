import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:http/http.dart';




// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await FirebaseMessaging.instance.getInitialMessage();
//   runApp( const Caretaker());
// }

class Caretaker extends StatefulWidget {
  const Caretaker({Key? key}) : super(key: key);

  @override
  State<Caretaker> createState() => _CaretakerState();
}

class _CaretakerState extends State<Caretaker> {

  //sms
  String? mtoken ="";

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=flutterLocalNotificationsPlugin;

  // TextEditingController username = TextEditingController();
  // TextEditingController title =TextEditingController();
  // TextEditingController body=TextEditingController();


  TextEditingController nameText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController phoneText = TextEditingController();


  
  @override
  void initState(){
    super.initState();

    requestPermission();
    // already done by steff
    getToken();
    // initinfo();
  } 



  void requestPermission() async {

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,

  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized){

    print("User granted permission ");

  }
  else if (settings.authorizationStatus == AuthorizationStatus.provisional){
  
    print("User granted provisional permission");

  }
  else {
  
    print("user declined or has not accepted permnission");
  }

  
  }


void getToken() async {
  await FirebaseMessaging.instance.getToken().then(
    (token){
      setState(() {
        mtoken = token;
        print("My token is $mtoken");
      });
      saveToken(token!);
    } );
}
void saveToken(String token) async {
  await FirebaseFirestore.instance.collection("Care Taker").doc("user2").set({
    'token':token,
  });
}



// void saveToken(String token) async {
//   await FirebaseFirestore.instance.collection("Care Taker").doc("user2").set({
//     'token':token,
//   });
// }

 initinfo(){
  var androidInitialize= const AndroidInitializationSettings('mipmap/ic_launcher');
  var iosInitialize = const IOSInitializationSettings();
  var initializationSettings = InitializationSettings(
    android: androidInitialize,
    iOS: iosInitialize,
  );
  flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification:(String?payload) async {
  try{
    if(payload != null && payload.isNotEmpty){

    }
    else{
  
    }

  }catch(e){
    //just comment 
  }
  return;
});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyanAccent,
          title: const Text(
            "Add caretaker details",
          )),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
            backgroundColor: Colors.cyanAccent,
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          "Caretaker details",
                        ),
                        actions: [
                          TextFormField(
                            controller: nameText,
                            decoration: const InputDecoration(hintText: "Name"),
                          ),
                          TextFormField(
                            controller: phoneText,
                            decoration:
                                const InputDecoration(hintText: "Phone Number"),
                          ),
                          TextFormField(
                            controller: emailText,
                            decoration: const InputDecoration(
                                hintText: "Email Address"),
                          ),
                          TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.cyanAccent)),
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
                          )
                        ],
                      ));
            }),
      ),
      //body: Expanded(child: ListView.builder(itemBuilder: (context))),
    );
  }
}

Future AddCareTakerDetails(
    {required String name,
    required String email,
    required String PhnNumber}) async {
  try {

    await FirebaseFirestore.instance
        .collection("Care Taker")
        .doc(email)
        .set({'name': name, 'phone number': PhnNumber});
  } on FirebaseAuthException catch (e) {
    String Toast = e.message.toString();
    Fluttertoast.showToast(msg: Toast);
  }
}
