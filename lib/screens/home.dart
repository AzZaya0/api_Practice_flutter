// ignore_for_file: prefer_const_constructors

import 'package:api_practice/providers/postProvider.dart';
import 'package:api_practice/services/controller.dart';
import 'package:api_practice/services/post_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    PostProvider provider = Provider.of<PostProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: PostService().getAll(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("loading.."),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  // Added 'return' here
                  child: Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: provider.data!.length,
                      itemBuilder: (context, index) {
                        return Text(provider.data![index].title.toString());
                      },
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                // Handle errors
                return Center(
                  child: Text(
                      'Oops, an error occurred: ${snapshot.error.toString()}'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Align(
            alignment: Alignment(1, 1),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                UserController().sendData('5', 'Hello', 'This is ds');
              },
            ),
          ),
        ],
      ),
    );
  }
}
