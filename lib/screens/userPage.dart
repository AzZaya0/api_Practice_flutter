import 'package:api_practice/myPostCard.dart';
import 'package:api_practice/services/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    userController.getAllUser();
    return Scaffold(
        appBar: AppBar(
          title: Text('All Users'),
        ),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Obx(() => ListView(
                    children: userController.allUserData
                        .map((e) => MyPostCard(
                            titleText: e.name,
                            buttonName: 'View User',
                            title: 'Name',
                            bodyText: e.email,
                            body: 'Email',
                            userId: e.id,
                            ontap: () {
                              
                            }))
                        .toList(),
                  )),
            ),
          ),
        ));
  }
}
