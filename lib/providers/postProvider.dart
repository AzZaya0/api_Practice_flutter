import 'package:api_practice/models/UserModels.dart';
import 'package:api_practice/services/post_services.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  List<UserModel>? data;
  PostService services = PostService();

  getPostData(context) async {
    data = await services.getAll();

    notifyListeners();
  }
}
