import 'dart:convert';
import 'package:api_practice/models/UserModel2.dart';
import 'package:dio/dio.dart';
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

  Future<void> sendData(userId, title, body) async {
    try {
      Message message = Message(
        userId: '10',
        title: title,
        body: 'Sample Body',
      );
      Map<String, dynamic> messageJson = message.toJson();
      UserModel2 userdata = new UserModel2();
      final requestBody = json.encode(messageJson);
      print(requestBody + 'hello');

      final response = await Dio().post(
        baseUrl,
        data: requestBody,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          followRedirects: false, // Disable automatic redirection
        ),
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        // Request was successful
        print('Data posted successfully');
      } else if (response.statusCode == 400) {
        // Handle the specific error response
        final Map<String, dynamic> errorResponse =
            json.decode(response.toString());
        print('Error Message: ${errorResponse['message']}');
        print('Errors: ${errorResponse['errors']}');
      } else {
        // Handle other error cases
        print('Failed to post data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
