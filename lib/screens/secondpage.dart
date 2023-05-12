import 'package:flutter/material.dart';
import 'package:login/reusable_widgets/Settings_file.dart';
import 'package:login/screens/account.dart';

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
              SettingsTile(color: Colors.cyan,
                  icon: Icons.person_outline,
                  title: "Account",
              onTap: (){
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Account()));
              },),
              const SizedBox(height: 40,),
              SettingsTile(color: Colors.cyan,
                  icon: Icons.info_outline,
                  title: "Edit Information",
              onTap: (){},),
              const SizedBox(height: 40,),
              SettingsTile(color: Colors.cyan,
                  icon: Icons.shield_moon_outlined,
                  title: "Theme",
                  onTap: (){},
              ),
              const SizedBox(height: 40,),
              SettingsTile(color: Colors.cyan,
                  icon: Icons.language_outlined,
                  title: "Language",
                onTap: (){},
              ),

            ],
          ),
        ),
    ),);
  }
}

