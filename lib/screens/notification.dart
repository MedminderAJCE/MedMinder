
import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
// import 'package:login/screens/homepage.dart';
  

class Notificationss extends StatefulWidget {
  final String phone;


   const Notificationss({Key? key, required this.phone}) : super(key: key);

  @override
  State<Notificationss> createState() => _NotificationssState();
}

class _NotificationssState extends State<Notificationss> {
  @override

  Widget build(BuildContext context) {
      return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            
            
child:ElevatedButton(
  onPressed: () async {
    final Uri url =Uri(
      scheme: 'sms' ,
    path: widget.phone
    );
   if( await canLaunchUrl(url)){
     print(widget.phone);
    await launchUrl(url);
   }
   else{
    print('cant launch');
   }
},
 child: const Text('Send notification to caretaker'),
 

 
          ),
          
        )
    )));
  }
}

