import 'dart:async';
import 'package:flutter/material.dart';
import 'package:masscore_web_admin/pages/login_page.dart';
class SplashPage extends StatefulWidget {
  static const String id ='splash-page';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => LoginPage())));
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/logo.png' ,width: 150,height: 150,),
      ),
    );
  }
}