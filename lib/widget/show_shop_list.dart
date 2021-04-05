import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterttest01/models/product_model.dart';
import 'package:flutterttest01/utillty/my_style.dart';
import 'package:flutterttest01/widget/show_pdf_view.dart';

class ShowShopList extends StatefulWidget {
  @override
  _ShowShopListState createState() => _ShowShopListState();
}

class _ShowShopListState extends State<ShowShopList> {
  List<Widget> widgets = [];
  List<ProductModel> productModels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

//ดึงข้อมูลมาวนรูป
  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize success');
      await FirebaseFirestore.instance
          .collection('product')
          .orderBy('name')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('map = $map');
          ProductModel model = ProductModel.fromMap(map); //ดึงค่ามาโชว์
          productModels.add(model);
          print('name = ${model.name}');
          setState(() {
            widgets.add(createWidget(model, index));
          });
          index++;
        }
      });
    });
  }

//เเสดงภาพเเละชื่อจากฐานข้อมูล
  Widget createWidget(ProductModel model, int index) => GestureDetector(
        onTap: () {
          print('คุณคลิ๊ก from index=$index');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowPdfView(
                  productModel: productModels[index],
                ),
              ));
        },
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 150,
                child: Image.network(model.cover),
              ),
              SizedBox(
                height: 16,
              ),
              MyStyle().titleH2(model.name),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : GridView.extent(maxCrossAxisExtent: 250, children: widgets),
    );
  }
}
