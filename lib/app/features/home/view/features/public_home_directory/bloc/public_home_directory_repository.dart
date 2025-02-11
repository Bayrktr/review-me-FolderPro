
import 'package:DocuSort/app/features/home/view/features/public_home_directory/model/public_directory_model.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/service/auth/firebase/exceptions/firebase_exceptions.dart';
import 'package:DocuSort/app/product/service/auth/firebase/firebase_auth.dart';
import 'package:DocuSort/app/product/service/database/firebase/collection/firestore_collection.dart';
import 'package:DocuSort/app/product/service/database/firebase/firebase_database.dart';

abstract class IPublicHomeDirectoryRepository {
  FirebaseDatabase get _firebaseDatabase;

  IFirebaseAuth get _firebaseAuth;
}

class PublicHomeDirectoryRepository implements IPublicHomeDirectoryRepository {
  @override
  FirebaseDatabase get _firebaseDatabase =>
      GetItManager.getIt<FirebaseDatabase>();

  @override
  IFirebaseAuth get _firebaseAuth => GetItManager.getIt<IFirebaseAuth>();

  bool get userCheck => _firebaseAuth.isUserNull;

  Future<List<PublicDirectoryModel?>?> getAllDirectory() async {
    final userId = _firebaseAuth.currentUser?.uid;
    print('user Id : $userId');
    if (userId == null) {
      throw const UserNotSignInFailure('user not signId');
    }
    final collectionReference = _firebaseDatabase.firestore
        .collection(FirestoreCollection.users.path)
        .doc(userId)
        .collection(FirestoreCollection.directory.path);
    final response = await _firebaseDatabase.fetchList<PublicDirectoryModel>(
      const PublicDirectoryModel(),
      collectionReference,
    );

    return response;
  }


}
