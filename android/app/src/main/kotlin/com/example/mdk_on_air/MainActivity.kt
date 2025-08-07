package com.example.mdk_on_air

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val POWER_CHANNEL = "com.mdk/power"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            POWER_CHANNEL
        ).setMethodCallHandler(PowerHandler(this)) // 분리된 핸들러 등록
    }
}
