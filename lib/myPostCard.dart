// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:api_practice/myButton.dart';
import 'package:flutter/material.dart';

class MyPostCard extends StatelessWidget {
  MyPostCard({
    Key? key,
    required this.titleText,
    required this.title,
    required this.body,
    required this.bodyText,
    required this.buttonName,
    this.userId,
    this.color,
    this.postId,
    required this.ontap,
  }) : super(key: key);
  final String titleText;
  final String title;
  final String body;
  final String bodyText;
  final String buttonName;
  final int? userId;
  final Color? color;
  final int? postId;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: color,
        child: Container(
          padding: EdgeInsets.all(10),
          height: ScreenHeight * 0.25,
          width: ScreenWidth * 0.5,
          child: Column(
            children: [
              SizedBox(
                height: ScreenHeight * 0.15,
                child: ListView(physics: BouncingScrollPhysics(), children: [
                  Text((userId.toString() == 'null') ? '' : userId.toString()),
                  Text(
                    '$title:\n' + titleText,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('$body :\n' + bodyText),
                ]),
              ),
              Divider(
                color: Colors.black,
                height: ScreenHeight * 0.02,
                thickness: 2,
              ),
              MyButton(
                  text: buttonName,
                  height: ScreenHeight * 0.05,
                  width: ScreenWidth * 0.8,
                  ontap: ontap)
            ],
          ),
        ),
      ),
    );
  }
}
