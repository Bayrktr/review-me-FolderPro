import 'dart:io';

import 'package:DocuSort/app/product/service/storage/firebase/exceptions/firebase_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';

final class IFirebaseStorage {
  IFirebaseStorage(FirebaseStorage? firebaseStorage)
      : _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  final FirebaseStorage _firebaseStorage;

  FirebaseStorage get firebaseStorage => _firebaseStorage;

  ListOptions _listOptions({int length = 10}) {
    return ListOptions(
      maxResults: length,
    );
  }

  Future<ListResult> getListAll(
    Reference ref,
  ) async {
    return ref.listAll();
  }

  Future<ListResult> getList(Reference ref, {int length = 10}) async {
    return ref.list(
      _listOptions(
        length: length,
      ),
    );
  }

  Future<void> putFile(Reference ref, File file) async {
    try {
      await ref.putFile(file);
    } on FirebaseException catch (e) {
      throw CloudStoragePutFileFailure.fromCode(e.code);
    } catch (_) {
      throw const CloudStoragePutFileFailure();
    }
  }

  Future<void> deleteFile(Reference ref) async {
    try {
      await ref.delete();
    } on FirebaseException catch (e) {
      throw CloudStorageDeleteFailure.fromCode(e.code);
    } catch (_) {
      throw const CloudStorageDeleteFailure();
    }
  }
}
