import 'package:api_practice/home.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage() ,
      
    );
  }
}