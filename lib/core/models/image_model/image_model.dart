import 'dart:io';

import 'image_entity.dart';

class ImageModel extends ImageEntity {
  ImageModel({
    String? base64,
    String? filePath,
    String? hashMd5,
    String? mimeImage,
    File? imageFile,
    String? url,
  }) : super(
          base64: base64,
          filePath: filePath,
          hashMd5: hashMd5,
          mimeImage: mimeImage,
          imageFile: imageFile,
          url: url,
        );

  static ImageModel init() {
    return ImageModel(
      base64: '',
      filePath: '',
      hashMd5: '',
      mimeImage: '',
      imageFile: File(''),
      url: '',
    );
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      base64: json['base64'] ?? '',
      filePath: json['filePath'] ?? '',
      hashMd5: json['hashMd5'] ?? '',
      mimeImage: json['mimeImage'] ?? '',
      imageFile: json['imageFile'] ?? File(''),
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base64'] = this.base64;
    data['filePath'] = this.filePath;
    data['hashMd5'] = this.hashMd5;
    data['mimeImage'] = this.mimeImage;
    data['imageFile'] = this.imageFile;
    data['url'] = this.url;
    return data;
  }
}
