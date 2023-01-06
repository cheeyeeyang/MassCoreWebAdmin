import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masscore_web_admin/pages/dashboard_page.dart';
import 'package:masscore_web_admin/pages/home_page.dart';
import '../statemanagement/auth_state.dart';
import '../statemanagement/validate_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValidateState validateState = Get.put(ValidateState());
  AuthState authState = Get.put(AuthState());
  final usernameT = TextEditingController();
  final passwordT = TextEditingController();
  String password = '';
  bool isPasswordVisible = true;

  @override
  void initState() {
    validateState.username = null;
    validateState.password = null;
    validateState.messageError = null;
    super.initState();

    usernameT.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    usernameT.dispose();
    passwordT.dispose();
    validateState.username = null;
    validateState.password = null;
    validateState.messageError = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fixSize = size.width + size.height;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: 480,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(children: [
                  Image.asset(
                    'images/logo.png',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  TextField(
                    controller: usernameT,
                    decoration: InputDecoration(
                      hintText: 'ຊື່ຜຸ້ໃຊ້',
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: usernameT.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () => usernameT.clear(),
                            ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  GetBuilder<ValidateState>(builder: (validate) {
                    if (validate.username != null) {
                      return Padding(
                        padding: EdgeInsets.only(top: h * 0.002),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                validate.username!,
                                style: TextStyle(
                                    fontSize: fixSize * 0.01,
                                    color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        height: 0,
                      );
                    }
                  }),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  TextField(
                    controller: passwordT,
                    onChanged: (value) => setState(() => this.password = value),
                    onSubmitted: (value) =>
                        setState(() => this.password = value),
                    decoration: InputDecoration(
                      hintText: 'ລະຫັດຜ່ານ',
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: IconButton(
                        icon: isPasswordVisible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () => setState(
                            () => isPasswordVisible = !isPasswordVisible),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    obscureText: isPasswordVisible,
                  ),
                  GetBuilder<ValidateState>(builder: (validate) {
                    if (validate.password != null) {
                      return Padding(
                        padding: EdgeInsets.only(top: h * 0.002),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                validate.password!,
                                style: TextStyle(
                                    fontSize: fixSize * 0.01,
                                    color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        height: 0,
                      );
                    }
                  }),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  GetBuilder<AuthState>(builder: (getSignIn) {
                    if (getSignIn.signCheck) {
                      return Container(
                        width: size.width,
                        height: fixSize * 0.035,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(fixSize * 0.002),
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.black45,
                                  offset: Offset(2, 2))
                            ]),
                        child: InkWell(
                          onTap: () {
                            if (usernameT.text.trim().isEmpty) {
                              validateState.setValUsername();
                            } else {
                              validateState.username = null;
                            }
                            if (passwordT.text.trim().isEmpty) {
                              validateState.setValPassword();
                            } else {
                              validateState.password = null;
                            }
                            validateState.update();
                            //use login function
                            if (usernameT.text.trim().isNotEmpty &&
                                passwordT.text.trim().isNotEmpty) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage()));
                              // authState.postSignIn(
                              //     context: context,
                              //     username: usernameT.text,
                              //     password: passwordT.text);
                            }
                          },
                          child: Center(
                            child: Text(
                              'login'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fixSize * 0.0185,
                                  fontFamily: 'Noto Sans Lao'),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
                  GetBuilder<ValidateState>(builder: (validate) {
                    if (validate.messageError != null) {
                      return Column(
                        children: [
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Text(
                            validate.messageError!,
                            style: TextStyle(
                                fontSize: fixSize * 0.01, color: Colors.red),
                          ),
                          SizedBox(
                            height: h * 0.005,
                          )
                        ],
                      );
                    } else {
                      return Container(
                        height: 0,
                      );
                    }
                  }),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
