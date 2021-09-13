import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // as firebase_storage;
import 'camera_repository.dart';

class CameraRepositoryImpl implements ICameraRepository {
  final FirebaseStorage _firebaseStorage;

  CameraRepositoryImpl(this._firebaseStorage);

  @override
  Future<String> sendImageToStorage({String? hashMD5, String? mimeImage, File? image}) async {
    try {
      Reference ref = _firebaseStorage.ref().child('production').child('images').child('$hashMD5');
      final metadata = SettableMetadata(
        contentType: '$mimeImage',
      );
      if (image != null) {
        await ref.putFile(image, metadata);
        var _publicURL = 'https://storage.googleapis.com/food-app-bb008.appspot.com/production/images/$hashMD5';
        return _publicURL;
      }
      return '';
    } catch (e) {
      print('🟥 sendImageToStorage-> ${e.toString()}');
      return '';
    }
  }
}
