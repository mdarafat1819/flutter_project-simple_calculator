import 'package:flutter/material.dart';

import './Widgets/home_page.dart';
import './Widgets/typing_page.dart';

int main() {
  runApp(MyApp());
  return 0;
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Typing Speed Test",
      home: HomePage(),
    );
  }
}