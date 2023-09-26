import 'dart:convert';
import 'package:api_practice/models/UserModels.dart';
import 'package:http/http.dart' as http;

class PostService {
  final String uri = 'https://cat-fact.herokuapp.com/facts/';

  Future<UserModel> getAll() async {
    late UserModel data;
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments/1'),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        data =
            UserModel.fromJson(item); // Mapping json response to our data model
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred' + e.toString());
    }
    return data;
  }
}
