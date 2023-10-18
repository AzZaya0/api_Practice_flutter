import 'package:api_practice/api/newsApi/getNewsApi.dart';
import 'package:api_practice/models/newsModel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class NewsController extends GetxController {
  @override
  void onInit() {
    getNews();
    // TODO: implement onInit
    super.onInit();
  }

  var loading = true.obs;
  List<Article> get articles => newsData.value.articles;
  final newsData = NewsModel(status: '', totalResults: 0, articles: []).obs;
  void getNews() async {
    var apiData = await GetNewsApi().getNewsFromApi();
    if (apiData != null) {
      loading.value = false;
      newsData.value = apiData;
    } else {
      loading.value = true;
    }
  }
}
