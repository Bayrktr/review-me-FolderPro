import 'package:DocuSort/app/features/home/view/features/public_home_directory/model/public_directory_model.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/temporary_file_model.dart';
import 'package:DocuSort/app/product/service/auth/firebase/exceptions/firebase_exceptions.dart';
import 'package:DocuSort/app/product/service/auth/firebase/firebase_auth.dart';
import 'package:DocuSort/app/product/service/database/firebase/collection/firestore_collection.dart';
import 'package:DocuSort/app/product/service/database/firebase/constant/firebase_filters/firebase_filters_constant.dart';
import 'package:DocuSort/app/product/service/database/firebase/firebase_database.dart';

abstract class ICloudFileRepository {
  FirebaseDatabase get _firebaseDatabase;

  IFirebaseAuth get _firebaseAuth;
}

class CloudFileRepository implements ICloudFileRepository {
  @override
  FirebaseDatabase get _firebaseDatabase =>
      GetItManager.getIt<FirebaseDatabase>();

  @override
  IFirebaseAuth get _firebaseAuth => GetItManager.getIt<IFirebaseAuth>();

  bool get userCheck => _firebaseAuth.isUserNull;

  // fixme
  Future<PublicDirectoryModel?> getDirectory({String? directoryId}) async {
    final userId = _firebaseAuth.currentUser?.uid;
    if (userId == null) {
      throw const UserNotSignInFailure('user not signId');
    }

    if (directoryId == null) {
      // fixme
      throw Exception();
    }

    final collectionReference = _firebaseDatabase.firestore
        .collection(FirestoreCollection.users.path)
        .doc(userId)
        .collection(
          FirestoreCollection.directory.path,
        )
        .doc(
          directoryId,
        );
    final response = await _firebaseDatabase.fetchData(
      const PublicDirectoryModel(),
      collectionReference,
    );
    return response;
  }

  Future<List<BaseFileModel?>> getFiles({String? fileKey}) async {
    final userId = _firebaseAuth.currentUser?.uid;
    if (userId == null) {
      throw const UserNotSignInFailure('user not signId');
    }

    if (fileKey == null) {
      // fixme
      print('fileKEy boş');
      throw Exception();
    }

    final collectionReference = _firebaseDatabase.firestore
        .collection(FirestoreCollection.users.path)
        .doc(userId)
        .collection(
          FirestoreCollection.files.path,
        );

    final response = await _firebaseDatabase.fetchListWithFilter(
      TemporaryFileModel(),
      collectionReference,
      FirebaseFiltersContant.fileKey,
      fileKey,
    );

    if (response == null) {
      return [];
    }

    final fileModels = response
        .whereType<TemporaryFileModel>()
        .map((model) => BaseFileModel.fromJson(model.toJson()))
        .toList();

    return fileModels;
  }

}
