import 'package:flutter/services.dart';

class HdmiWatcher {
  static const _channel = MethodChannel('com.mdk/hdmi');

  static void initialize() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'hdmi_status') {
        final bool isConnected = call.arguments as bool;
        print('HDMI 연결 상태: ${isConnected ? "연결됨" : "해제됨"}');
        // 연결에 따른 UI 로직 수행
      }
    });
  }
}
