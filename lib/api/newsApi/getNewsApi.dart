import 'dart:convert';

import 'package:api_practice/models/newsModel.dart';
import 'package:api_practice/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetNewsApi {
  final dio = Dio();
  late NewsModel newsData;
  String uri =
      'https://newsapi.org/v2/everything?q=applea&apiKey=a25a0c0b883c4f389ff5c23da0f9dfea';
  Future<NewsModel?>? getNewsFromApi() async {
    final response = await dio.get(
      uri,
    );

    try {
      if (response.statusCode == 200) {
        NewsModel newdata = NewsModel.fromJson(response.data);
        newsData = newdata;
        print(newdata);
        return newsData;
      } else {}
    } catch (e) {
      print(e);
      return null;
    }
  }
}
