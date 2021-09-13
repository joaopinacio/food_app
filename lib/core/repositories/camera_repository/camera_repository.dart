import 'dart:io';

abstract class ICameraRepository {
  Future<String> sendImageToStorage({
    String? hashMD5,
    String? mimeImage,
    File? image,
  });
}
