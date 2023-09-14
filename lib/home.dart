import 'dart:convert';

import 'package:api_practice/models/UserModels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //must

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      userList = (json.decode(response.body) as List)
          .map((data) => UserModel.fromJson(data))
          .toList();
    } else {
      return userList;
    }
    return userList;
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: Text(index.toString()),
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
