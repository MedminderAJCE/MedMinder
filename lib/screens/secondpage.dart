import 'package:flutter/material.dart';
import 'package:login/reusable_widgets/Settings_file.dart';
import 'package:login/screens/account.dart';
import 'package:login/screens/addmedicine.dart';
import 'package:login/screens/firstpage.dart';
import 'package:login/screens/notification.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Settings", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
              ),
             const SizedBox(height: 40,),
              SettingsTile(color: Colors.cyanAccent,
                  icon: Icons.person_outline,
                  title: "Account",
              onTap: (){
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Account()));
              },),
              const SizedBox(height: 40,),
              SettingsTile(color: Colors.cyanAccent,
                  icon: Icons.person,
                  title: "Caretaker",
                  onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Caretaker()));
                  },
              ),
              const SizedBox(height: 40,),
              SettingsTile(color: Colors.cyanAccent,
                  icon: Icons.medical_information,
                  title: "Add Medicine",
                onTap: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const AddMedicine()));
                },
              ),

            ],
          ),
        ),
    ),);
  }
}

