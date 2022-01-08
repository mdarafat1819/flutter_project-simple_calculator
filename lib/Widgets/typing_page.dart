import 'dart:math';

import 'package:flutter/material.dart';

class Typing extends StatefulWidget {
  List<String>randomWord = [];
  Typing(this.randomWord);
  State<StatefulWidget> createState() {
    return _Typing();
  }
}

class _Typing extends State<Typing> {
  int correct = 0, wrong = 0, accuracy = 0, speed = 0, randomIdx = 0;
  var orginal_paragraph, typed_paragraph;

  Widget resultBar(title, value) {

    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(3),
              color: Color(0xff384a58),
              child: Text(
                title.toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(3),
              color: Colors.white,
              child: Text(
                value.toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff384a58),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )
          ]),
    );
  }

  void result(text, idx) {
    if(text == (widget.randomWord[idx] + " ")) {
      correct++;
    }
    else {
      wrong++;
    }
  }
  var _input =  new TextEditingController();

  void initState() {
    super.initState();
    randomIdx = Random().nextInt(widget.randomWord.length);
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Practice"),
        backgroundColor: Color(0xfffc846f),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
          resultBar("Correct", correct),
          resultBar("Wrong", wrong),
          resultBar("Accuracy", accuracy),
          resultBar("Speed", speed),
            ],
          ),
          Divider(
            color: Color(0xff384a58),
            thickness: 3,
          ),

          Text(widget.randomWord[randomIdx].toString(), style: TextStyle(
            fontSize: 60,
          ),),
          TextField(

            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40,
               // color: _input.text == randomWord[randomIdx].substring(0, _input.text.length) ?
               // Colors.green : Colors.red,
            ),
            controller: _input,
            decoration: InputDecoration(
              hintText: "Type",
            ),

            onChanged: (value){

              if(value[value.length - 1] == ' ') {
                setState(() {
                  _input.clear();
                });

              }
            },
          ),
          /*Expanded(child:
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 15,),
                Text("Original Paragraph", textAlign: TextAlign.center,style: TextStyle(fontSize: 25, color: Color(0xff384a58)),),
                SingleChildScrollView(
                  child: Container(

                    child: Text(orginal_paragraph.toString() , textAlign: TextAlign.center,),
                  ),
                ),
              ],
            ),
          ),),*/
        /*  Expanded(child:
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 15,),
                Text("Typed Paragraph", textAlign: TextAlign.center,style: TextStyle(fontSize: 25, color: Color(0xff384a58)),),
                SingleChildScrollView(
                  child: Container(

                    child: Text(typed_paragraph.toString() , textAlign: TextAlign.center,),
                  ),
                ),
              ],
            ),
          ),),*/
        ],
      ),
    );
  }
}
