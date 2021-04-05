import 'package:flutter/material.dart';
import 'package:flutterttest01/utillty/my_style.dart';

Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: ListTile(
              leading: Image.asset('images/logotest1.png'),
              title: Text(
                'เเจ้งเตือน',
                style: MyStyle().redBoldStyle(),
              ),
              subtitle: Text(string),
            ),
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('OK'))
            ],
          ));
}
