import 'package:api_practice/models/UserModels.dart';
import 'package:api_practice/services/post_services.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  PostService _service = PostService();
  bool isLoading = false;
  List<UserModel> _posts = [];
  List<UserModel> get posts => _posts;
  //
  Future<void> getAllPost() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _posts = response;
    isLoading = true;
    notifyListeners();
  }
}
