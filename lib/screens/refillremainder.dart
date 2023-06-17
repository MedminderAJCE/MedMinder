import 'package:flutter/material.dart';
// import 'package:login/screens/account.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:url_launcher/url_launcher.dart';



class refillremainder extends StatefulWidget {
  const refillremainder({super.key});

  @override
  State<refillremainder> createState() => _refillremainderState();
}

class _refillremainderState extends State<refillremainder> {
  //notifications 
  NotificationServices notificationServices = NotificationServices();

  //sms


  // final _formkey = GlobalKey<FormState>();
  // final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _msgcontroller =TextEditingController();
  // final TextEditingController _valueSms=TextEditingController();



  @override
  void initState(){
    super.initState();

    notificationServices.initialiseNotification();
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: SizedBox(
          width: 300,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Total number  of medicines ",
                    // labelStyle: const TextStyle(color: Color(0xFF00E5FF) ),
                    focusColor: const Color(0xFF00E5FF),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                  ),
                ),
                Container(
                  height: 30,
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Total quantity left",
                    // labelStyle: const TextStyle(color: Color(0xFF00E5FF) ),
                    focusColor: const Color(0xFF00E5FF),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: const BorderSide(
                          color: Color(0xFF00E5FF),
                        )),
                  ),
                ),
                Container(
                  height: 20,
                ),

                //backend
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const refillremainder()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320.0, 50.0),
                    backgroundColor: const Color(0xFF00E5FF),
                  ),
                  child: const Text('Send Notification',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
                Container(
                  height: 20,
                ),

                ElevatedButton(
                  onPressed: () {
                    notificationServices.sendNotification(
                      "Time to refill the medicine",
                       "time to fill the  xyz medicine");
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const refillremainder()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320.0, 50.0),
                    backgroundColor: const Color(0xFF00E5FF),
                  ),
                  child: const Text('Send notifi',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),

                    Container(
                  height: 20,
                ),

                ElevatedButton(
                  onPressed: () {
                    notificationServices.scheduleNotification(
                      'scheduled for minute', 
                      'test');
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const refillremainder()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320.0, 50.0),
                    backgroundColor: const Color(0xFF00E5FF),
                  ),
                  child: const Text('Schedule notifi',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),


                
                    Container(
                  height: 20,
                ),

                ElevatedButton(
                  onPressed: () {
                    notificationServices.stopnotification();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const refillremainder()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320.0, 50.0),
                    backgroundColor: const Color(0xFF00E5FF),
                  ),
                  child: const Text('Stop  notifi',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
                    Container(
                  height: 20,
                ),

                ElevatedButton(
                  onPressed: () async  {

                    // final Uri url =Uri(
                    //   scheme :'sms',
                    //   path :"828 9998 286"
                    // );
                    //  if (await canLaunchUrl(url)){
                    //   await launchUrl(url);

                    //  }
                    //  else{
                    //   print("show dialog:cannot launch this url");
                    //  }
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const refillremainder()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320.0, 50.0),
                    backgroundColor: const Color(0xFF00E5FF),
                  ),
                  child: const Text('sms demo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),

              ],
            ),
          ),
        )),
      ),
    );
  }
}


//  flutter notifications 
class NotificationServices{
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = 
  FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings = AndroidInitializationSettings('mipmap/ic_launcher');

  void initialiseNotification() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,

    );
     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }


  void sendNotification(String title , String body) async {
  
      AndroidNotificationDetails androidnotificationdetails =const AndroidNotificationDetails(
        'channelId', 
        'channelName',
        importance: Importance.max ,
        // icon: "icon",
        priority: Priority.high);

         NotificationDetails notificationDetails=NotificationDetails(
          android: androidnotificationdetails
         );

   await  _flutterLocalNotificationsPlugin.show(
      0, 
      title,
       body, 
       notificationDetails);
  }
  void scheduleNotification(String title , String body) async {
  
      AndroidNotificationDetails androidnotificationdetails =const AndroidNotificationDetails(
        'channelId', 
        'channelName',
        importance: Importance.max ,
        // icon: "icon",
        priority: Priority.high);

         NotificationDetails notificationDetails=NotificationDetails(
          android: androidnotificationdetails
         );

   await  _flutterLocalNotificationsPlugin.periodicallyShow(
      0, 
      title,
       body, 
       RepeatInterval.everyMinute,
       notificationDetails);
  }
  void stopnotification() async {
    _flutterLocalNotificationsPlugin.cancel(0);
  }

}