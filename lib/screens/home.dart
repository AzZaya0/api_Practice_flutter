import 'package:api_practice/providers/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PostProvider>(context, listen: false).getAllPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Api With Provider')),
        body: Consumer<PostProvider>(
          builder: (context, value, child) {
            //
            final data = value.posts;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final post = data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    child: Text(post.title.toString()),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
