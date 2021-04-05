import 'dart:convert';

class ProductModel {
  final String name;
  final String cover;
  final String pdf;
  ProductModel({
     this.name,
     this.cover,
     this.pdf,
  });

  ProductModel copyWith({
    String name,
    String cover,
    String pdf,
  }) {
    return ProductModel(
      name: name ?? this.name,
      cover: cover ?? this.cover,
      pdf: pdf ?? this.pdf,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cover': cover,
      'pdf': pdf,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      cover: map['cover'],
      pdf: map['pdf'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProductModel(name: $name, cover: $cover, pdf: $pdf)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductModel &&
      other.name == name &&
      other.cover == cover &&
      other.pdf == pdf;
  }

  @override
  int get hashCode => name.hashCode ^ cover.hashCode ^ pdf.hashCode;
}

//