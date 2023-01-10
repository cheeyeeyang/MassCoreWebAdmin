import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:masscore_web_admin/statemanagement/app_verification.dart';
import 'package:masscore_web_admin/statemanagement/validate_state.dart';
class SubjectState extends GetxController {
  AppVerification appVerification = Get.put(AppVerification());
  ValidateState validateState = Get.put(ValidateState());
  dynamic subjectData = [];
  dynamic subjectdataList = [];
  bool addCheck = false;
  bool checkData = false;
  getsubjectData() async {
    checkData = false;
    update();
    var response = await http.get(
        Uri.parse('https://localhost:7047/api/Subject'),headers: {'authorization': 'Bearer ${appVerification.token}'});
    if (response.statusCode == 200) {
      subjectData = jsonDecode(response.body);
      setSubject();
    } else {
      print('get subjects Fail');
    }
  }
  setSubject() async{
    subjectdataList = [];
    update();
    for(var item in subjectData) {
      subjectdataList.add(item);
    }
    checkData = true;
    update();
  }
  //create data
  postSave({required String name,required bool active}) async {
    addCheck = false;
    validateState.messageError = null;
    update();
    try {
      var res = await http.post(
        Uri.parse('https://localhost:7047/api/Subject'),
        body: jsonEncode({'name': name, 'active': active}),
        headers: {
          "Content-Type": "application/json",
          'authorization': 'Bearer ${appVerification.token}'
        },
      );
      if (res.statusCode == 200) {
        print('save new appointment success');
        addCheck = true;
        getsubjectData();
        update();
      } else {
        addCheck = false;
        print('save new data Fail');
        validateState.setMessageError();
      }
    } catch (e) {
      print(e);
    }
    update();
  }
  //update data
  postUpdate({required int id,required String name,required bool active}) async {
    addCheck = false;
    validateState.messageError = null;
    update();
    try {
      var res = await http.put(
        Uri.parse('https://localhost:7047/api/Subject/${id}'),
        body: jsonEncode({'name': name, 'active': active}),
        headers: {
          "Content-Type": "application/json",
          'authorization': 'Bearer ${appVerification.token}'
        },
      );
      if (res.statusCode == 200) {
        print('save new appointment success');
        addCheck = true;
        getsubjectData();
        update();
      } else {
        addCheck = false;
        print('save new data Fail');
        validateState.setMessageError();
      }
    } catch (e) {
      print(e);
    }
    update();
  }
}
