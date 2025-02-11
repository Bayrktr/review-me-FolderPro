import 'package:DocuSort/app/product/service/database/firebase/model/base_firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class FirebaseDatabase {
  FirebaseDatabase(FirebaseFirestore? firestore)
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  FirebaseFirestore get firestore => _firestore;

  Future<List<T?>?> fetchList<T extends BaseFirebaseModel<T>>(
    T data,
    CollectionReference reference,
  ) async {
    final response = await reference.withConverter<T?>(
      fromFirestore: (snapshot, option) {
        return data.fromFirebase(snapshot);
      },
      toFirestore: (value, option) {
        return {};
      },
    ).get();

    print('response : $response');

    if (response.docs.isNotEmpty) {
      for (final doc in response.docs) {
        try {
          print('Document data: ${doc.data()}');
        } catch (e) {
          print('Hata oluştu: $e');
        }
      }
      final values = response.docs.map((e) => e.data()).toList();
      print(values);
      return values;
    }
    return null;
  }

  Future<T?> fetchData<T extends BaseFirebaseModel<T>>(
    T data,
    DocumentReference reference,
  ) async {
    final response = await reference.withConverter<T?>(
      fromFirestore: (snapshot, options) {
        return data.fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return {};
      },
    ).get();

    print('Response: $response');

    try {
      final result = response.data();
      print('Document data: $result');
      return result;
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  Future<List<T?>?> fetchListWithFilter<T extends BaseFirebaseModel<T>>(
    T data,
    CollectionReference reference,
    String field,
    dynamic value,
  ) async {
    final response = await reference
        .withConverter<T?>(
          fromFirestore: (snapshot, options) {
            return data.fromFirebase(snapshot);
          },
          toFirestore: (value, options) {
            return {};
          },
        )
        .where(field, isEqualTo: value)
        .get();

    print('response: $response');

    if (response.docs.isNotEmpty) {
      for (final doc in response.docs) {
        try {
          print('Document data: ${doc.data()}');
        } catch (e) {
          print('Hata oluştu: $e');
        }
      }
      final values = response.docs.map((e) => e.data()).toList();
      print(values);
      return values;
    }

    return null;
  }
}
