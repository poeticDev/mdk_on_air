import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:mdk_on_air/model/basicInfo.dart';

part 'drift.g.dart';

@DriftDatabase(tables: [BasicInfo])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  static AppDatabase? _instance;

  static AppDatabase get instance {
    if (_instance == null) {
      _instance = AppDatabase();
    }
    return _instance!;
  }

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // driftDatabase from package:drift_flutter stores the database in
    // getApplicationDocumentsDirectory().
    return driftDatabase(name: 'tablet_database');
  }
}
