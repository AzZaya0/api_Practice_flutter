// ignore_for_file: file_names

import 'dart:convert';

import 'package:api_practice/api/userApi.dart';
import 'package:get/get.dart';
import 'package:api_practice/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  RxList<UserModel> allUserData = <UserModel>[].obs;
  RxList<UserModel> NewAllUserData = <UserModel>[].obs;
  RxList<UserModel> aUserData = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    checkData(); //incase there is some changes in api data
  }

  Future<String?> storeAllUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = await UsersApi().getAllUsers();
    final jsondata = jsonEncode(data.map((todo) => todo.toJson()).toList());
    pref.setString('AllUserData', jsondata);
    getAllUser;
    return jsondata;
  }

  void checkData() async {
    final data = await storeAllUser();

    if (data != null) {
      final List<dynamic> decodedData = jsonDecode(data);
      NewAllUserData.assignAll(
        decodedData.map<UserModel>((data) => UserModel.fromJson(data)).toList(),
      );
      if (allUserData != NewAllUserData) {
        await storeAllUser();
      } else {
        getAllUser();
      }
    }
  }

  Future getAllUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final jsondata = pref.getString('AllUserData');
    if (jsondata != null) {
      final List<dynamic> decodedData = jsonDecode(jsondata);
      allUserData.assignAll(
        decodedData.map<UserModel>((data) => UserModel.fromJson(data)).toList(),
      );
    }
  }

  void getSingleUser(id) async {
    aUserData.clear();
    var data2 = await UsersApi().getSingleUsers(id);
    aUserData.addAll(data2);
  }
}
