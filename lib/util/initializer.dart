import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdk_on_air/util/custom_permission_handler.dart';
import 'package:mdk_on_air/util/drift.dart';
import 'package:mdk_on_air/util/global_data.dart';
import 'package:mdk_on_air/util/kiosk.dart';
import 'package:mdk_on_air/util/mqtt_manager.dart';

class AppInitializer {
  static bool _isInitialized = false;

  /// 싱글턴 패턴
  static final AppInitializer _instance = AppInitializer._internal();

  factory AppInitializer() => _instance;

  AppInitializer._internal();

  static bool getInitializedStatus() {
    return _isInitialized;
  }

  static Stream<String> initialize(WidgetRef ref) async* {
    if (_isInitialized) {
      yield 'done';
    }

    /// 1. 하드웨어 세팅
    /// 1.1 필수권한 요청
    yield '필수 권한 요청 중...';
    await _requestPermissions();

    /// 1.2 키오스크 모드 활성화 및 네비게이션 바 숨김
    KioskModeManager.enableKioskMode();
    KioskModeManager.hideNavigationBar();

    /// 2. Data
    /// 2.1. GetIt 세팅
    /// 2.2 Database 열기
    yield 'Database 여는 중...';
    AppDatabase.openDB();

    // 전역 데이터 초기화 및 업데이트
    await globalData.updateGlobalData();

    /// 3. Network
    /// 3.1 OSC -> 스튜디오 불필요
    /// 3.2 MQTT
    yield 'MQTT 매니저 초기화 중...';
    try {
      await openMqttManager(ref)
          .then((_) {
            subscribeTopics(ref);
          })
          .timeout(Duration(seconds: 10));
    } catch (e) {
      print(' ❌ Mqtt 매니저 초기화 실패! : $e');
    }

    _isInitialized = true;
    yield ' ';
  }

  // 권한 요청 처리
  static Future<void> _requestPermissions() async {
    final permissionHandler = CustomPermissionHandler();

    print('위치 권한 요청 중');
    await permissionHandler.requestLocationPermission();
    print('시스템 알람창 권한 요청 중');
    await permissionHandler.requestSystemAlertWindowPermission();
    print('미디어 접근 권한 요청 중');
    await permissionHandler.requestMediaPermissions();
  }

  /// 3.2. Network
  /// 3.2.1 MqttManager 오픈
  static Future<void> openMqttManager(WidgetRef ref) async {
    print('MqttManager를 오픈 중입니다...');
    try {
      mqttManager = MqttManager(
        broker: globalData.serverIp,
        port: globalData.serverMqttPort,
        userName: globalData.serverMqttId,
        password: globalData.serverMqttPassword,
        clientId: globalData.deviceId,
      );
      await mqttManager.connect();
    } catch (e) {
      print('❌ MQTT 연결 실패: $e');
    }
  }

  /// 3.2.2 토픽 구독
  static void subscribeTopics(WidgetRef ref) {
    for (var topic in SUBSCRIBING_TOPICS) {
      mqttManager.subscribe(topic);
    }
    mqttManager.listen((topic, message) {
      onMqttReceived(ref, topic, message);
    });
  }
}
