import 'dart:convert';
import 'package:api_practice/models/UserModels.dart';
import 'package:http/http.dart' as http;

class PostService {
  final String uri = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<UserModel>> getAll() async {
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final post = json.map((e) {
        return UserModel(
          id: e['id'],
          body: e['body'],
          title: e['title'],
          userId: e['userId'],
        );
      }).toList();
      return post; // Return the list of UserModels here
    } else {
      return []; // Return an empty list if the response status code is not 200
    }
  }
}
