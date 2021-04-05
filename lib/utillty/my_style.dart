import 'package:flutter/material.dart';

//สิ่งที่เอาไว้ใช้หลายครั้ง เเละเปลี่ยนเเปลงค่าได้
class MyStyle {
  Color darkColor = Color(0xff9f6500);
  Color prinaryColor = Color(0xffd69300);
  Color lightColor = Color(0xffffc344);

  BoxDecoration boxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(20), color: Colors.white38);

  TextStyle redBoldStyle() =>
      TextStyle(color: Colors.red, fontWeight: FontWeight.bold);

  Widget showLogo() => Image.asset('images/logotest1.png');
//การใช้ตัวอักษร ไว้ใช้ 3 ชุด
  Widget titleH1(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: darkColor,
        ),
      );

  Widget titleH2(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: darkColor,
        ),
      );

  Widget titleH3(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          //fontWeight: FontWeight.bold,
          color: darkColor,
        ),
      );

  Widget titleH2white(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      );

  Widget titleH3white(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          //fontWeight: FontWeight.bold,
          color: Colors.white54,
        ),
      );

  MyStyle();
}
