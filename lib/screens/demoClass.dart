import 'package:flutter/material.dart';

class NewsGui extends StatelessWidget {
  const NewsGui({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: ScreenHeight,
        width: ScreenWidth,
        alignment: Alignment.center,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('data'),
              );
            }),
      ),
    );
  }
}
