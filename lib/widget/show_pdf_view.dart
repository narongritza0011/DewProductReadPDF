import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:flutterttest01/models/product_model.dart';
import 'package:flutterttest01/utillty/my_style.dart';

class ShowPdfView extends StatefulWidget {
  final ProductModel productModel;
  ShowPdfView({Key key, this.productModel}) : super(key: key);
  @override
  _ShowPdfViewState createState() => _ShowPdfViewState();
}

class _ShowPdfViewState extends State<ShowPdfView> {
  ProductModel model;
  PDFDocument pdfDocument;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = widget.productModel;
    createPDFDocument();
  }

  Future<Null> createPDFDocument() async {
    try {
      var result = await PDFDocument.fromURL(model.pdf);
      setState(() {
        pdfDocument = result;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().prinaryColor,
        title: Text(
            model.name == null ? 'Read Product' : model.name), //เเสดงชื่อสินค้า
      ),
      body: pdfDocument == null
          ? Center(child: CircularProgressIndicator())
          : PDFViewer(document: pdfDocument),
    );
  }
}
