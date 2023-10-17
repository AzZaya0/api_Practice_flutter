import 'dart:convert';

import 'package:api_practice/models/newsModel.dart';
import 'package:api_practice/utils/constants.dart';
import 'package:dio/dio.dart';

class NewsApi {
  final dio = Dio();
  late NewsModel newsData;
  String uri = Constants.baseurl;
  Future<NewsModel?>? getNewsFromApi() async {
    final response = await dio.get(uri);
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.data);
        final newdata = NewsModel.fromJson(data);
        newsData = data;
        print(data);
        return newsData;
      } else {}
    } catch (e) {
      print(e);
      return null;
    }
  }
}
