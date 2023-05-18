import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<QuestionAnswer> faqList = [
    QuestionAnswer(
        'Can different medications have different sounds with the reminders?',
        'At this time you cannot assign different sounds with the reminders.We apologize for any inconvenience caused.'),
    QuestionAnswer('Can I change my email address on my MedMinder account?',
        'Yes! To change your email address on your  account, please tap on your avatar on the bottom-right corner of the home screen.You can edit your account and verify the changes.'),
    QuestionAnswer('How can I reset my password?',
        'To reset your password:\n\n *Tap on your profile icon on the bottom right corner of home screen to open your account.\n\n*If you are not logged in tap on "Forgot Password" in the login page.\n\n*Enter your email address and then you will receive an email to reset your password.'),
    // Add more question-answer pairs as needed
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
