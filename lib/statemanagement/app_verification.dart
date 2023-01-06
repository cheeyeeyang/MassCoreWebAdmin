import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppVerification extends GetxController {
  GetStorage storage = GetStorage();

  String token = "";
  setInitToken() {
    token = storage.read('token') ?? "";
    print("this is my " + token);
    update();
  }

  setNewToken({required String text}) async {
    await storage.write('token', text);
    token = storage.read('token') ?? "";
    update();
  }

  removeToken() async {
    await storage.write('token', "");
    token = "";
    update();
  }
}
