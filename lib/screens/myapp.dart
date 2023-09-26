import 'package:api_practice/models/UserModels.dart';
import 'package:api_practice/providers/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<UserModel> future_getAll;
  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Handle REST api'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: postMdl.loading
            ? Center(
                child: Container(
                  child: const CircularProgressIndicator(),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 20),
                    child: Text(
                      postMdl.data!.title.toString(),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Container(
                    child: Text(
                      postMdl.data!.body ?? "",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
