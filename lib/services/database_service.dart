import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../exceptions/database_exception.dart';

class DatabaseService extends GetxService {
  FirebaseDatabase _database;
  DatabaseReference _ref;

  DatabaseService() {
    _database = FirebaseDatabase.instance;
    _ref = _database.reference();
    _database.setPersistenceEnabled(true);
  }

  Future<DataSnapshot> getSnapshot(String path) async {
    final reference = _ref.child(path);
    await reference.keepSynced(true);
    try {
      return await reference.once();
    } on DatabaseError catch (e) {
      throw DatabaseException(e.message);
    }
  }

  Future<void> setData(
      String path, String key, Map<String, dynamic> value) async {
    try {
      final reference = _ref.child(path);
      await reference.child(key.toString()).set(value);
    } on DatabaseError catch (e) {
      throw DatabaseException(e.message);
    }
  }
}
