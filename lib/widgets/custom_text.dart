import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleState extends GetxController {}

class CustomText extends StatelessWidget {
  CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocaleState>(builder: (localeUpdate) {
      return Text(
        text.tr,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontFamily: "boonhome",
          fontWeight: fontWeight,
        ),
      );
    });
  }
}
