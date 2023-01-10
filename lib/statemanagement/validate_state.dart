import 'package:get/get.dart';

class ValidateState extends GetxController {
  String? username;
  String? password;
  String? email;
  String? name;
  String? confirmPassword;
  String? messageError;
  String? registerFail;
  String? question;
  String? answer;
  String? firstname;
  String? lastname;
  String? phone;
  String? vill_id;
  String? dis_id;
  String? pro_id;
  String? distription;
  String? latlng;
  setValAnswer() {
    answer = 'ກະລຸນາຕອບຄໍາຖາມກ່ອນ';
    update();
  }

  setValquestion() {
    question = 'ກະລຸນາໃສ່ຄໍາຖາມກ່ອນ';
    update();
  }

  setValUsername() {
    username = 'ລະບຸຊື່ຜູ້ໃຊ້ກ່ອນ';
    update();
  }

  setValPassword() {
    password = 'ໃສ່ລະຫັດຜ່ານກ່ອນ';
    update();
  }

  setValEmail() {
    email = 'please_enter_your_email';
    update();
  }

  setValName() {
    name = 'ກາລຸນາໃສ່ຊື່ກ່ອນ';
    update();
  }

  setValConfirm() {
    confirmPassword = 'please_enter_confirm';
    update();
  }

  setMessageError() {
    messageError = 'ຊື່ຜູ້ໃຊ້ ຫຼື ລະຫັດຜ່ານບໍ່ຖືກ';
    update();
  }

  setRegisterFail() {
    registerFail = 'registration_was_not_successful';
    update();
  }
  setFirstname() {
    firstname = 'ໃສ່ຊື່ກ່ອນ';
    update();
  }
  setLastname() {
    lastname = 'ໃສ່ນາມສະກຸນກ່ອນ';
    update();
  }
  setPhone() {
    phone = 'ໃສ່ເບີໂທກ່ອນ';
    update();
  }
  setVillage() {
    vill_id = 'ໃສ່ບ້ານກ່ອນ';
    update();
  }
  setDistrict() {
    dis_id = 'ໃສ່ເມືອງກ່ອນ';
    update();
  }
  setProvince() {
    pro_id = 'ໃສ່ແຂວງກ່ອນ';
    update();
  }
  setDistription() {
    distription = 'ໃສ່່ເນື້ອໃນສົນທະນາກ່ອນ';
    update();
  }
  setLatLng() {
    latlng = 'ຢືນຢັນທີ່ຢູ່ປະຈຸບັນກ່ອນ';
    update();
  }
}
