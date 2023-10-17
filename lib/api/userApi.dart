// ignore_for_file: file_names

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:api_practice/models/userModel.dart';

class UsersApi {
  var dio = Dio();
  List<UserModel> allUserData = [];
  List<UserModel> aUserData = [];

  String AllUserUri = 'https://jsonplaceholder.typicode.com/users';
  Future<List<UserModel>> getAllUsers() async {
    try {
      final response = await dio.get(AllUserUri);

      if (response.statusCode == 200) {
        List<UserModel> posts = userModelFromJson(
            jsonEncode(response.data)); // Convert response.data to JSON string
        allUserData.addAll(posts);
        return allUserData;
      } else {}
    } catch (e) {
      return allUserData;
    }
    return allUserData;
  }

  Future<List<UserModel>> getSingleUsers(int id) async {
    aUserData.clear();
    try {
      final response2 = await dio.get(
        'https://jsonplaceholder.typicode.com/users/$id/',
        options: Options(
          headers: {'Content-Type': 'application/json'},
          followRedirects: false, // Disable automatic redirection
        ),
      );

      if (response2.statusCode == 200) {
        final userData = UserModel.fromJson(response2.data);
        aUserData.add(userData);
        return aUserData;
      }
    } catch (e) {
      print(e);
    }

    return aUserData;
  }
}
