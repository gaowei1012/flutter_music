import 'package:flutter/material.dart';
import 'package:flutter_music/pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}