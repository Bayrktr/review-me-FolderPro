import 'package:cloud_firestore/cloud_firestore.dart';

mixin BaseFirebaseModel<T> {
  Map<String, dynamic> toJson();

  T fromJson(Map<String, dynamic> json);

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw Exception('$snapshot data is null');
    }

    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}

mixin IdModel {
  String? get id;
}
