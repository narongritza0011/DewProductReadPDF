import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterttest01/utillty/my_style.dart';
import 'package:flutterttest01/widget/information_login.dart';
import 'package:flutterttest01/widget/show_shop_list.dart';

class Myservice extends StatefulWidget {
  @override
  _MyserviceState createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  String name, email;
  Widget currenWidget = ShowShopList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findNameandEmail();
  }

  Future<Null> findNameandEmail() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event.displayName;
          email = event.email;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().prinaryColor,
      ),
      drawer: buildDrawer(),
      body: currenWidget,
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Stack(
        children: [
          Column(
            children: [
              buildUserAccountsDrawerHeader(),
              buildListTileShowshopcart(),
              buildListTileinformation(),
            ],
          ),
          buildSignOut(),
        ],
      ),
    );
  }

  ListTile buildListTileShowshopcart() {
    return ListTile(
      leading: Icon(Icons.shopping_cart),
      title: Text('สินค้า'),
      subtitle: Text('ดูรายการสินค้า'),
      onTap: () {
        setState(() {
          currenWidget = ShowShopList();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildListTileinformation() {
    return ListTile(
      leading: Icon(Icons.account_box),
      title: Text('Information'),
      subtitle: Text('Information User Login'),
      onTap: () {
        setState(() {
          currenWidget = Information();
        });
        Navigator.pop(context);
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg1.jpg'),
        ),
      ),
      //เเสดงชื่อผู้ใช้งาน
      accountName: MyStyle().titleH2(name == null ? 'Name' : name),
      accountEmail: MyStyle().titleH3(email == null ? 'Email' : email),
      currentAccountPicture: Image.asset('images/logotest1.png'),
    );
  }

  Column buildSignOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            await Firebase.initializeApp().then((value) async {
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/authen', (route) => false));
            });
          },
          tileColor: MyStyle().darkColor,
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 36,
          ),
          title: MyStyle().titleH2white('Sign Out'),
          subtitle: MyStyle().titleH3white('ออกจากระบบเพื่อไปหน้าล็อกอิน'),
        ),
      ],
    );
  }
}
