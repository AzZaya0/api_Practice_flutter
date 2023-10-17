import 'package:api_practice/providers/postProvider.dart';
import 'package:api_practice/screens/demoClass.dart';

import 'package:api_practice/screens/home2.dart';
import 'package:api_practice/screens/userPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostProvider(),
      child: GetMaterialApp(
        home: NewsGui(),
      ),
    );
  }
}
