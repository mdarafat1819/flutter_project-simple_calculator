import 'package:flutter/material.dart';

import './typing_page.dart';

class HomePage extends StatelessWidget {

  List<String>characterList = [
   "A", "B","C", "D", "E", "F", "G", "H", "I", "J",
    "K", "L", "M", "N", "O", "Q", "R", "T", "U", "V", "W", "Y", "Z",
    "a", "b","c", "d", "e", "f", "g", "h", "i", "j",
    "k", "l", "m", "n", "o", "q", "r", "s", "u", "v", "w", "y", "z",
  ];
  List<String>numberList = [
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"
  ];
  List<String>wordList = [
    "There", "are", "many", "variations", "of", "passages", "of", "Lorem", "Ipsum",
    "available", "but", "the", "majority", "have", "suffered", "alteration", "in", "some", "form",
    "by", "injected", "humour", "or", "randomised", "words" ];
  Widget boxItem(context, icon, title, dataList) {
    return Expanded(
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/"+icon, height: 40, width: 40,alignment: Alignment.center,),
            SizedBox(height: 10,),
            Text(title, style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)
          ],
        ),
        onTap: (){
         Navigator.push(context, CustomPageRoute(builder: (context) => Typing(dataList)));
        },
      ),
    );
  }
  Widget verticalDivider() {
    return Container(
        height: 100,
        child: VerticalDivider(
          // color: Colors.red,
          thickness: 2,
        )
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Typing Speed Test"),
        backgroundColor: Color(0xfffc846f),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   boxItem(context, 'character_practice.png', "Character\nPractice", characterList),
                    verticalDivider(),
                    boxItem(context, 'word_practice.png', "Word\nPractice", wordList),
                    verticalDivider(),
                    boxItem(context, 'number_practice.png', "Number\nPractice", numberList),
                  ],
                ),
              ),
          ),
          Expanded(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  boxItem(context, 'free_hand.png', "FreeHand\n", characterList),
                  verticalDivider(),
                  boxItem(context, 'give_a_test.png', "Give\nA Test", characterList),
                  verticalDivider(),
                  boxItem(context, 'test_history.png', "Test\nHistory", characterList),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  boxItem(context, 'profile.png', "Profile", characterList),
                  verticalDivider(),
                  boxItem(context, 'contact_us.png', "Contact Us", characterList),
                  verticalDivider(),
                  boxItem(context, 'developer.png', "Developer", characterList),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}