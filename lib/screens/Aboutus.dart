import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome to Our App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'About Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                  'MedMinder is dedicated to helping you stay on track with your medication schedule and ensure your health and well-being.'
                    ' Our app is designed to simplify the process of managing your medications, making it easier for you to adhere to your'
                  'prescribed treatment plan. At our core, we understand the challenges that can arise when it comes to remembering to take medications regularly.'
                ' Our goal is to provide a user-friendly and intuitive platform that empowers you to stay organized and never miss a dose.\n\n'
                'Key Features:\n\n'
                     '1. Medication Reminders: Our app sends you personalized reminders when it is'
                      'time to take your medications. You can set up multiple reminders throughout the day and customize them based on your specific needs.\n\n'
                      '2. Schedule Management: With our app, you can easily manage your medication schedule. You can add, remove, or update medications, dosages, and frequencies. The app allows you to input crucial information, such as the purpose of each medication and any special instructions.\n\n'
                      '3. Refill Reminders: Running out of medications can be a hassle. Our app helps you stay on top of your medication supply by sending you reminders when it is time to refill your '
                      'prescriptions. You can also keep track of your remaining medication quantities.\n\n'
                      '4. Medication History and Tracking: Our app provides a comprehensive medication history, allowing you to track your adherence and monitor your progress over time. You can view your past medication intake, missed doses, and overall compliance.\n\n',
              ),
              SizedBox(height: 16.0),
              Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'We have the highest regard for your privacy and personal '
                    'information and realize that the success of our services '
                    'depends on the trust that you have in the way we handle your '
                    'personal information. We want to reassure you that we will do everything '
                    'in our power to keep the information you confide to us private.'
                    'We have taken considerable steps to protect the confidentiality, '
                    'security and integrity of this information. We encourage you to review the '
                    'following information carefully.\n\n'
                    'GROUNDS FOR DATA COLLECTION:\n\n'
                    'When you use our Service, you consent to the collection, storage, '
                    'use, disclosure and other uses of your personal information as '
                    'described in this Privacy Policy. Processing of your Personal '
                    'Information (meaning, any information which may potentially allow '
                    'your identification with reasonable means; hereinafter “Personal Information”) '
                    'is necessary for the performance of our contractual obligations towards '
                    'you and providing you with our Service, to protect our legitimate interests, '
                    'to ensure compliance with legal and financial regulatory obligations, or '
                    'otherwise, subject to your consent.\n\n'
                    'HOW DO WE COLLECT DATA:\n\n'
                     'By creating a profile or register with us – you will be asked to provide Personal\n\n'
                      'It is your voluntary decision whether to provide us with any Personal Information or Health Information, '
                    'however if you do not provide this information you may not be able to '
                    'create a profile or register with the Service and your use of the '
                    'Service may be limited.'
                    ,
              ),
              SizedBox(height: 16.0),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Email: medminderajce@gmail.com',
              ),

            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutUsPage(),
  ));
}