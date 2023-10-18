// ignore_for_file: prefer_const_constructors

import 'package:api_practice/controller/newsController.dart';
import 'package:api_practice/models/newsModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsGui extends StatefulWidget {
  const NewsGui({super.key});

  @override
  State<NewsGui> createState() => _NewsGuiState();
}

class _NewsGuiState extends State<NewsGui> {
  final NewsController controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    print('build');
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'NewsFeeds',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: ScreenHeight,
          width: ScreenWidth,
          alignment: Alignment.center,
          child: Obx(
            () => controller.loading.value
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.articles.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Card(
                                elevation: 8,
                                child: Column(
                                  children: [
                                    Container(
                                      height: ScreenHeight * 0.2,
                                      width: ScreenWidth * 0.8,
                                      padding: EdgeInsets.only(top: 10),
                                      child: CachedNetworkImage(
                                        imageUrl: controller
                                            .articles[index].urlToImage!,
                                        fit: BoxFit.contain,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                          controller.articles[index].title),
                                      contentPadding: EdgeInsets.all(20),
                                      subtitle: Text(controller
                                          .articles[index].description),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      alignment: Alignment.bottomRight,
                                      child: Text((index + 1).toString()),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
/* ListView(
                          shrinkWrap:
                              true, // Important: Make the ListView shrink-wrap
                          children: controller.newsData.value.articles
                              .map((e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Container(
                                              height: ScreenHeight * 0.2,
                                              width: ScreenWidth * 0.8,
                                              child: Image.network(
                                                e.urlToImage!,
                                                fit: BoxFit.fill,
                                              )),
                                          ListTile(
                                            title: Text(e.title),
                                            contentPadding: EdgeInsets.all(20),
                                            subtitle: Text(e.description),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),*/