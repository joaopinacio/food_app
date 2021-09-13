import 'dart:io';

abstract class ImageEntity {
  String? base64;
  String? filePath;
  String? hashMd5;
  String? mimeImage;
  File? imageFile;
  String? url;

  ImageEntity({
    this.base64,
    this.filePath,
    this.hashMd5,
    this.mimeImage,
    this.imageFile,
    this.url,
  });
}
