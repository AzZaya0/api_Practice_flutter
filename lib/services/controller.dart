import 'dart:convert';
import 'package:api_practice/models/UserModel2.dart';
import 'package:http/http.dart' as http;

class UserController {
  static const String baseUrl = 'http://10.0.2.2:8000/api/postdata';

  Future<UserModel2> fetchUserData() async {
    final response = await http.get(Uri.parse('$baseUrl'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      UserModel2 userdata = UserModel2.fromJson(responseData);
      return userdata;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<Data> fetchDataById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return Data.fromJson(responseData);
    } else {
      throw Exception('Failed to load data by id');
    }
  }
}
