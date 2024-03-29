import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterttest01/utillty/dialog.dart';
import 'package:flutterttest01/utillty/my_style.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  double screen;
  String name, user, password;

  Container buildName() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white38),
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => name = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
            hintStyle: TextStyle(color: MyStyle().darkColor),
            hintText: 'Name:',
            prefixIcon: Icon(
              Icons.fingerprint,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().lightColor),
            )),
      ),
    );
  }

  Container buildUser() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white38),
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => user = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
            hintStyle: TextStyle(color: MyStyle().darkColor),
            hintText: 'User:',
            prefixIcon: Icon(
              Icons.perm_identity,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().lightColor),
            )),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white38),
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
            hintStyle: TextStyle(color: MyStyle().darkColor),
            hintText: 'Password:',
            prefixIcon: Icon(
              Icons.lock_outline,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().lightColor),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(
        backgroundColor: MyStyle().prinaryColor,
        title: Text('New Register'),
      ),
      body: Center(
        child: Column(
          children: [
            buildName(),
            buildUser(),
            buildPassword(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: MyStyle().darkColor,
      onPressed: () {
        print(
            'name = $name, user = $user, password = $password'); //เช็คค่าในข้อมูลที่สมัครว่าว่างไหมเเละเเจ้งเตือน
        if ((name?.isEmpty ?? true) ||
            (user?.isEmpty ?? true) ||
            (password?.isEmpty ?? true)) {
          print('กรุณากรอกข้อมูลให้ครบ');
          normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ');
        } else {
          print('สมัครสมาชิกเเล้ว');
          registerFirebase();
        }
      },
      child: Icon(Icons.cloud_upload_rounded),
    );
  }

  Future<Null> registerFirebase() async {
    await Firebase.initializeApp().then((value) async {
      print('firebase initialize success');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: user, password: password)
          .then((value) async {
        print('สมัครสมาชิกสำเร็จ');
        await value.user.updateProfile(displayName: name).then(
              (value) => Navigator.pushNamedAndRemoveUntil(
                  context, '/myService', (route) => false),
            );
      }).catchError((value) {
        normalDialog(context, value.message);
      });
    });
  }
}
//หน้าสมัครสมาชิก
