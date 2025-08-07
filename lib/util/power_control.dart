import 'package:flutter/services.dart';

class PowerControl {
  static const platform = MethodChannel('com.mdk/power');

  static Future<void> shutdown() async {
    try {
      await platform.invokeMethod('shutdown');
    } on PlatformException catch (e) {
      print("Failed to shutdown: ${e.message}");
    }
  }
}
