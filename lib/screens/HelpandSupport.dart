import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<QuestionAnswer> faqList = [
    QuestionAnswer('What is  MedMinder?',
        'MedMinder is a mobile application designed to help users manage their medication schedules and set reminders for taking prescribed medications. It helps ensure that users take their medications on time and as prescribed by their healthcare providers.'),
    QuestionAnswer('How does the medicine reminder app work?',
        'The app allows you to create a personalized medication schedule by adding your medications, dosages, and specific times for reminders. It sends notifications or alarms to remind you when it is time to take your medication. Some apps may also provide additional features like tracking medication adherence and generating reports.'),
    QuestionAnswer(
        'Can different medications have different sounds with the reminders?',
        'At this time you cannot assign different sounds with the reminders.We apologize for any inconvenience caused.'),
    QuestionAnswer('Can I change my email address on my MedMinder account?',
        'Yes! To change your email address on your  account, please tap on your avatar on the bottom-right corner of the home screen.You can edit your account and verify the changes.'),
    QuestionAnswer('How can I reset my password?',
        'To reset your password:\n\n *Tap on your profile icon on the bottom right corner of home screen to open your account.\n\n*If you are not logged in tap on "Forgot Password" in the login page.\n\n*Enter your email address and then you will receive an email to reset your password.'),
    QuestionAnswer('Can I add multiple medications to the app?',
        'Absolutely! Our app supports the management of multiple medications. You can add all your prescribed medications, vitamins, and supplements, along with their respective dosages and schedules.'),
    QuestionAnswer('How can I contact your team in case of any queries?',''
        'Attention!, MedMinder support team is unable to answer any medical or medication related questions.\n\n We will be happy to help with any app related questions at medminderajce@gmail.com')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text('FAQ'),
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqList[index].question),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(faqList[index].answer),
              ),
            ],
          );
        },
      ),
    );
  }
}

class QuestionAnswer {
  final String question;
  final String answer;

  QuestionAnswer(this.question, this.answer);
}
