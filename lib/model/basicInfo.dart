import 'package:drift/drift.dart';

class BasicInfo extends Table {
  /// 0. 아이디
  IntColumn get id => integer().autoIncrement()();

  /// 1. 디바이스 정보
  TextColumn get deviceId => text()();

  TextColumn get deviceName => text()();

  TextColumn get sensorName => text()();

  TextColumn get wifiName => text().nullable()();

  /// 2. 서버
  TextColumn get serverIp =>
      text().withDefault(const Constant('192.168.11.120'))();

  IntColumn get serverMqttPort => integer().withDefault(const Constant(1883))();

  TextColumn get serverMqttId => text().withDefault(const Constant('mdk'))();

  TextColumn get serverMqttPassword =>
      text().withDefault(const Constant('12344321'))();

  /// 3. 생성일
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
