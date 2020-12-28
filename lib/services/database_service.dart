import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../exceptions/database_exception.dart';

class DatabaseService extends GetxService {
  FirebaseDatabase _database;
  DatabaseReference _ref;

  DatabaseService() {
    this._database = FirebaseDatabase.instance;
    this._ref = _database.reference();
    _database.setPersistenceEnabled(true);
  }

  Future<DataSnapshot> getSnapshot(String path) async {
    var reference = _ref.child(path);
    reference.keepSynced(true);
    try {
      return await reference.once();
    } on DatabaseError catch (e) {
      throw DatabaseException(e.message);
    }
  }
}
