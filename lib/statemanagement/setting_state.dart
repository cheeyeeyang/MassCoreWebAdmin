import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class SettingState extends GetxController {
  dynamic subjectData = [];
  dynamic subjectdataList = [];
  bool checkData = false;
  //get notification
  getsubjectData() async {
    checkData = false;
    update();
    var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      subjectData = jsonDecode(response.body);
      setBranch();
    } else {
      print('get fund Youth Fail');
    }
  }
  setBranch() async{
    subjectdataList = [];
    update();
    for (var item in subjectData) {
      subjectdataList.add(item);
    }
    checkData = true;
    update();
  }
}
