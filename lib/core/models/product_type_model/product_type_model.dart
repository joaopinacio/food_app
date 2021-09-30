import 'product_type_entity.dart';

class ProductTypeModel extends ProductTypeEntity {
  ProductTypeModel({
    required String uid,
    required String name,
  }) : super(
          uid: uid,
          name: name,
        );

  static ProductTypeModel init() {
    return ProductTypeModel(
      uid: '',
      name: '',
    );
  }

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) {
    return ProductTypeModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
    };
  }
}
