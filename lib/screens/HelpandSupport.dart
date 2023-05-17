import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<QuestionAnswer> faqList = [
    QuestionAnswer('Question 1', 'Answer 1'),
    QuestionAnswer('Question 2', 'Answer 2'),
    QuestionAnswer('Question 3', 'Answer 3'),
    // Add more question-answer pairs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
