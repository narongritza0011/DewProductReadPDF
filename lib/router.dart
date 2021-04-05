import 'package:flutter/material.dart';
import 'package:flutterttest01/widget/authen.dart';
import 'package:flutterttest01/widget/my_service.dart';
import 'package:flutterttest01/widget/register.dart';

final Map<String, WidgetBuilder> routes = {
  '/authen': (BuildContext context) => Authen(),
  '/register': (BuildContext context) => Register(),
  '/myService': (BuildContext context) => Myservice(),
};

//หน้าใช้Rout ให้ไปหลายหน้าได้
