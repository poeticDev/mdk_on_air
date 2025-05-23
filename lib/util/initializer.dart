

import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    if(_isInitialized) {
      yield 'done';

    }

    /// 1. 하드웨어 세팅
    /// 1.1 필수권한 요청
    yield '필수 권한 요청 중...';
    await _requestPermissions();

    /// 1.2 키오스크 모드 활성화 및 네비게이션 바 숨김

    /// 2. Data
    /// 2.1. GetIt 세팅
    /// 2.2 Database 열기


    // 전역 데이터 초기화 및 업데이트

    // 버튼과 페이지 데이터 초기화

    /// 3. Network
    /// 3.1 OSC -> 스튜디오 불필요
    /// 3.2 MQTT

    _isInitialized = true;
    yield ' ';
  }

  static Future<void> _requestPermissions() async {

  }

}