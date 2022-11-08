// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'appBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain=AppBrain();

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title:Text('لعبة اختبار معلومات',
          style: TextStyle(
            color: Colors.white)
            ),
          backgroundColor: Colors.grey,
          ),
         
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Exam(),
        ),

      )
    );
  }
}
class Exam extends StatefulWidget {
  const Exam({super.key});

  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
 
  void checkAnswer(bool input){
     
              setState(() {
                bool correct =appBrain.getAnswer();
                
               
                if(correct == input)
                {
                  insertResult.add(Padding(
            padding: const EdgeInsets.all(3),
            child: Icon(Icons.thumb_up,
            color:Colors.green),
          ));
          trueAnswer++;}
                else{
            insertResult.add(Padding(
             padding: const EdgeInsets.all(3),
             child: Icon(Icons.thumb_down,
          color:Colors.red),
           ));

                }
                
                if(appBrain.isFinished()==false){
                  appBrain.nextQuestion();
                }
                else{
                  Alert(context: context,
                  title:'انهاء اللعبة',
                  desc:'لقد أجبت على $trueAnswer أسئلة بشكل صحيح',
                  buttons: [
                    DialogButton(
                      child: Text('ابدأ من جديد',
                      style:TextStyle(
                        color:Colors.white,
                        fontSize:20,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,

                      )
                  ],
                  ).show();
                  
                  appBrain.reset();
                  trueAnswer=0;
                  insertResult=[];
                }
                
              });

  }
  List<Widget>insertResult = [];
  int trueAnswer=0;
  
  
 
 
  
  @override
  Widget build(BuildContext context) {
     
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
     
      children: [
        Row(children: insertResult,),
        Expanded(
          flex :9,
          child: Column(
          children: [
            Image.asset(appBrain.getImage()),
            SizedBox(
              height: 20,
            ),
            Text(
              appBrain.getQuestion(),
            style : TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,)
          ],
        )
        ),
        Expanded(
          flex :1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton (
            onPressed : (){
              checkAnswer(true);
            },
            child :Text('صح',
            style:TextStyle(
              fontSize: 24,
              color: Colors.white,
            )),
            
        ),
          )
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton (
            onPressed : (){
              checkAnswer(false);

            },
            child :Text('خطأ',
            style:TextStyle(
                fontSize: 24,
                color: Colors.white,
              )
              ),
            
        ),
          ))


      ],
    );
  }
}