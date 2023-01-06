import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:masscore_web_admin/statemanagement/app_verification.dart';
import 'package:masscore_web_admin/statemanagement/validate_state.dart';

import '../models/user_model.dart';
import '../pages/home_page.dart';

class AuthState extends GetxController {
  AppVerification appVerification = Get.put(AppVerification());
  int pageIndex = 0;
  UserModel? userModel;
  bool signCheck = true;
  bool registerCheck = true;
  String  validateName = '';
  String  validateEmail ='';
  bool checkUser = false;
  ValidateState validateState = Get.put(ValidateState());
  updatePageIndex(int index) {
    pageIndex = index;
    update();
  }
  //post for signIn function
  postSignIn({required BuildContext context,required String username, required String password}) async {
    signCheck = false;
    validateState.messageError = null;
    update();
    try {
      var res = await http.post(
        Uri.parse('https://localhost:7047/api/Authenticate/login'),
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (res.statusCode == 200) {
        print('login success');
        await appVerification.setNewToken(text: jsonDecode(res.body)['token']);
        // await checkToken();
        signCheck = true;
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        signCheck = true;
        print('login Fail');
        validateState.setMessageError();
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  //check login when open app
  checkToken() async {
    if (appVerification.token == '') {
    } else {
      // await getUser();
    }
  }

  //getUser Information from token
  getUser() async {
    checkUser = false;
    update();
    var res = await http.get(Uri.parse('http://192.168.43.75:80/api/user'),
        headers: {'authorization': 'Bearer ${appVerification.token}'});
    if (res.statusCode == 200) {
      var dataUser = jsonDecode(res.body)['user'];
      userModel = UserModel.fromJson(dataUser);
      checkUser = true;
      update();
    } else {
      print('getUser Fail');
    }
  }

  //signOut from token
  signOut({required BuildContext context}) async {
    var res = await http.post(
      Uri.parse("http://192.168.43.75:80/api/logout"),
      headers: {'Authorization': "Bearer ${appVerification.token}"},
    );
    print(res.statusCode);
    if (res.statusCode == 200) {
      appVerification.removeToken();
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print('logout error');
    }
  }
  String getValidate(String validate) {
    if (validate != '') {
      return validate;
    } else {
      return '';
    }
  }
}
