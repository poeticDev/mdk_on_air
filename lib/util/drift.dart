import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:get_it/get_it.dart';
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

  /// Database Open
  static void openDB() {
    if (!GetIt.I.isRegistered<AppDatabase>()) {
      final db = instance;
      GetIt.I.registerSingleton<AppDatabase>(db);
    }
  }

  /// BASIC INFO ///
  // basicInfo 테이블에서 정보를 받아오는 함수(Future: 한 번, Stream: 계속)
  Future<BasicInfoData?> getLatestBasicInfo() async {
    final query = select(basicInfo)
      ..orderBy([
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
      ])
      ..limit(1);  // limit을 직접 사용

    final result = await query.get();  // 쿼리 실행

    // 결과가 있을 경우 첫 번째 데이터를 반환
    return result.isNotEmpty ? result.first : null;
  }

  Future<List<BasicInfoData>> getBasicInfos() => select(basicInfo).get();

  Stream<List<BasicInfoData>> streamBasicInfos() => select(basicInfo).watch();

  // basicinfo를 생성
  Future<int> createBasicInfo(BasicInfoCompanion data) =>
      into(basicInfo).insert(data);

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // driftDatabase from package:drift_flutter stores the database in
    // getApplicationDocumentsDirectory().
    return driftDatabase(name: 'tablet_database');
  }
}
