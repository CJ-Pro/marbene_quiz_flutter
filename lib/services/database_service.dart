import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../exceptions/exceptions.dart';

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
    } catch (e) {
      throw UnknownException('Unknown error occurred.');
    }
  }

  void setData(String path, String key, dynamic value) {
    _ref.child(path)..child(key).set(value);
  }

  void updateData(String path, Map<String, dynamic> value) {
    _ref.child(path)..update(value);
  }
}
