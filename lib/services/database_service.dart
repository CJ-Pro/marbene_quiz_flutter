import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService extends GetxService {
  FirebaseDatabase _database;

  DatabaseService() {
    this._database = FirebaseDatabase.instance;
    _database.setPersistenceEnabled(true);
  }

  DatabaseReference get ref => _database.reference();
}
