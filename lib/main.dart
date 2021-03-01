import 'package:flutter/material.dart';
import 'package:quizz/questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questioNum=0;
  int currentScore=0;
  Questions questions=Questions();
  
  updatescore(bool a){
    setState(() {
      if(questions.questionBank[questioNum].ans==a){
        currentScore++;
      }
      if(questioNum==questions.questionBank.length-1){
        questioNum=0;
      }
      else{
        questioNum++;
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        centerTitle: true,
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(questions.questionBank[questioNum].ques,style: TextStyle(fontSize: 20.0),),
            RaisedButton(onPressed: (){updatescore(true);},child: Text("True"),),
            RaisedButton(onPressed: (){updatescore(false);},child: Text("False"),),
            Container(padding: EdgeInsets.all(15),child: Text("Current Score is:$currentScore ",style: TextStyle(fontSize: 15.0),))

          ],
        ),
      ),
    );
  }
}
