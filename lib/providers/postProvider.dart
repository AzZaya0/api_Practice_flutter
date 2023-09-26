import 'package:api_practice/models/UserModels.dart';
import 'package:api_practice/services/post_services.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  UserModel? data;

  bool loading = false;
  PostService services = PostService();

  getPostData(context) async {
    loading = true;
    data = await services.getAll();
    loading = false;

    notifyListeners();
  }
}
