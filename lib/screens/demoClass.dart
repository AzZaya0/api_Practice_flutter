import 'package:api_practice/controller/newsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsGui extends StatefulWidget {
  const NewsGui({super.key});

  @override
  State<NewsGui> createState() => _NewsGuiState();
}

class _NewsGuiState extends State<NewsGui> {
  @override
  Widget build(BuildContext context) {
    print('build');
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;

    // Using an Rx variable for your NewsController
    final NewsController controller = Get.put(NewsController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          height: ScreenHeight,
          width: ScreenWidth,
          alignment: Alignment.center,
          child: Obx(
            () => controller.loading.value
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap:
                              true, // Important: Make the ListView shrink-wrap
                          children: controller.newsData.value.articles
                              .map((e) => ListTile(
                                    title: Text(e.title),
                                    subtitle: Text(e.description),
                                  ))
                              .toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          height: ScreenHeight *
                              0.07, // Adjust the height as needed
                          child: TextField(),
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
