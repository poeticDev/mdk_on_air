import 'package:flutter/services.dart';

class PowerController {
  static const _channel = MethodChannel('com.mdk/power');

  static Future<void> shutdown() async {
    try {
      await _channel.invokeMethod('shutdown');
    } catch (e) {
      print('Shutdown failed: $e');
    }
  }
}
