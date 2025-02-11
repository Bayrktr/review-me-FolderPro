enum FirestoreCollection {
  users('users'),
  directory('directory'),
  files('files'),
  ;

  const FirestoreCollection(this._value);

  final String _value;


  String get path => _value;
}
