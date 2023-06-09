import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimePicker extends StatefulWidget {
  final Function(TimeOfDay)? onTimeSelected;

  const TimePicker({Key? key, this.onTimeSelected}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  Future<void> initializeNotifications() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload == 'alarm_payload') {
        // Handle stop alarm action here
        stopAlarm();
      } else {
        // Handle other notification actions
        if (payload != null) {
          debugPrint('Notification payload: $payload');
        }
      }
    });

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'my_notification_channel',
      'My Notifications',
      description: 'Notification Channel for MedMinder',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      _handleTimeSelection(selectedTime);
    }
  }

  void _handleTimeSelection(TimeOfDay selectedTime) {
    if (widget.onTimeSelected != null) {
      widget.onTimeSelected!(selectedTime);
    }

    setState(() {
      _timeOfDay = selectedTime;
    });

    final DateTime now = DateTime.now();
    final DateTime selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    final bool isAfter = selectedDateTime.isAfter(now);
    if (isAfter) {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'my_notification_channel',
        'My Notifications',
        channelDescription: 'Notification Channel for MedMinder',
        importance: Importance.high,
      );

      final NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'It\'s time to take your medicines',
        'Taking medicines on time could make you healthy, don\'t forget!',
        tz.TZDateTime.from(selectedDateTime, tz.local),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'alarm_payload',
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Time'),
            content: const Text('Please select a future time.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void stopAlarm() {
    // Handle stopping the alarm (e.g., stop sound)
    print('Alarm stopped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6096B4),
              Color(0xFF51B9CD),
              Color(0xFF00E5FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              _timeOfDay.format(context).toString(),
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
            MaterialButton(
              onPressed: _showTimePicker,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "PICK TIME",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 25,
                  ),
                ),
              ),
              color: Colors.white,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              child: Text(
                'Go back',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
