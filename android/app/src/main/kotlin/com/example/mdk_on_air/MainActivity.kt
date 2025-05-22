package com.example.mdk_on_air

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.DataOutputStream

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.mdk/power"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "shutdown") {
                try {
                    val process = Runtime.getRuntime().exec("su")
                    val outputStream = DataOutputStream(process.outputStream)
                    outputStream.writeBytes("reboot -p\n")
                    outputStream.flush()
                    outputStream.writeBytes("exit\n")
                    outputStream.flush()
                    process.waitFor()
                    result.success(true)
                } catch (e: Exception) {
                    result.error("SHUTDOWN_FAILED", e.message, null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}