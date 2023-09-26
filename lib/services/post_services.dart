import 'dart:convert';
import 'package:api_practice/models/UserModels.dart';
import 'package:http/http.dart' as http;

class PostService {
  final String uri = 'https://jsonplaceholder.typicode.com/posts';

  Future getAll() async {
    List<UserModel> datas = [];
    try {
      final response = await http.get(
        Uri.parse(uri),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        //
        for (Map<String, dynamic> index in item) {
          datas.add(UserModel.fromJson(index));
        }
        return datas;

        // Mapping json response to our data model
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred' + e.toString());
    }
  }
}
