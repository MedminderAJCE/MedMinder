
import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Notificationss extends StatefulWidget {
  const Notificationss({super.key});

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
    path: '9446712686'
    );
   if( await canLaunchUrl(url)){
    await launchUrl(url);
   }
   else{
    print('cant launch');
   }
},
 child: const Text('hai'))          ),
          
        )
    ));
  }
}

