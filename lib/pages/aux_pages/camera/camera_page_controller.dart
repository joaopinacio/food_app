import 'dart:io';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/layout/themes/app_themes.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:mime/mime.dart';

class CameraPageController extends GetxController {
  CameraPageController() {
    image = Get.arguments['data'];
    initCamera();
  }

  void initCamera() {
    imagePath.value = image?.filePath ?? '';
    hashMD5.value = image?.hashMd5 ?? '';
    url.value = image?.url ?? '';
  }

  final picker = ImagePicker();

  var imagePath = ''.obs;
  var hashMD5 = ''.obs;
  var url = ''.obs;

  get getImagePath => imagePath.value;
  get getHashMD5 => hashMD5.value;
  get getUrl => url.value;

  String mimeImage = '';
  String? imageBase64 = '';
  String? status;

  ImageModel? image;

  File? imageFile;

  Future<void> loadImage() async {
    try {
      PickedFile? file;
      file = await picker.getImage(source: ImageSource.gallery);
      editImage(file!.path);
    } catch (e) {
      print('🟥 Error Load Galery ${e.toString()}');
    }
  }

  Future<bool> onWillPop() async {
    await pop();
    return false;
  }

  Future<void> loadCamera() async {
    try {
      PickedFile? file;
      file = await picker.getImage(source: ImageSource.camera);
      editImage(file!.path);
    } catch (e) {
      print('🟥 Error Load Camera ${e.toString()}');
    }
  }

  _addImageModel() {
    image = ImageModel();
    image!.base64 = imageBase64;
    image!.hashMd5 = getHashMD5;
    image!.mimeImage = mimeImage;
    image!.filePath = getImagePath;
    image!.imageFile = imageFile;
  }

  Future<String?> applyHashMD5(String imageBase64) async {
    Digest digest;
    try {
      var bytes = utf8.encode(imageBase64);
      digest = md5.convert(bytes);
      print('🟦 HASH MD5 ${digest.toString()}');
      return digest.toString();
    } catch (e) {
      print('🟥 Error MD5 ${e.toString()}');
      return null;
    }
  }

  Future<String?> convertImageInBase64(String filePath) async {
    try {
      ImageProperties properties = await FlutterNativeImage.getImageProperties(filePath);
      imageFile = await FlutterNativeImage.compressImage(filePath,
          quality: 80, targetWidth: 600, targetHeight: (properties.height! * 600 / properties.width!).round());
      List<int> imageBytes = imageFile!.readAsBytesSync();
      mimeImage = lookupMimeType(filePath)!;
      return base64Encode(imageBytes).trim();
    } catch (e) {
      print('🟥 Error convertImageBase64 ${e.toString()}');
      return null;
    }
  }

  removeImage() {
    imagePath.value = '';
    hashMD5.value = '';
    mimeImage = '';
    imageBase64 = '';
    imageFile = null;
    url.value = '';
    status = '';

    image = ImageModel();
    image!.hashMd5 = '';
    image!.mimeImage = '';
    image!.base64 = '';
    image!.imageFile = null;
    image!.url = '';
  }

  pop() async {
    if (imagePath.value.isNotEmpty) {
      imageBase64 = (await convertImageInBase64(getImagePath))!;
      hashMD5.value = (await applyHashMD5(imageBase64!.trim()))!;

      _addImageModel();
    }
    Get.back(result: image);
  }

  Future<void> editImage(String path) async {
    final File? croppedFile = await ImageCropper.cropImage(
        sourcePath: path,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'edit_image'.tr,
          toolbarColor: AppThemes.colors.white,
          toolbarWidgetColor: AppThemes.colors.black,
        ),
        iosUiSettings: IOSUiSettings(
          title: 'edit_image'.tr,
          cancelButtonTitle: 'cancel'.tr,
          doneButtonTitle: 'conclude'.tr,
        ));
    if (croppedFile != null) {
      onImageSelected(croppedFile);
    }
  }

  onImageSelected(File file) async {
    imagePath.value = file.path;
    if (imagePath.value.isNotEmpty) {
      imageBase64 = (await convertImageInBase64(getImagePath));
      hashMD5.value = (await applyHashMD5(imageBase64!.trim()))!;
      _addImageModel();
    }
  }

  @override
  void onClose() {
    super.dispose();
    print('🟦 Dispose Camera Controller');
  }
}
