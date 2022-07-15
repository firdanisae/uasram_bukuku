import 'package:flutter/material.dart';
import 'package:flutter_bookapp/screens/home.dart';
import 'package:flutter_bookapp/screens/koleksi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}
