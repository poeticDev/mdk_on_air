package com.example.mdk_on_air

import android.content.Context
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.DataOutputStream

class PowerHandler(private val context: Context) : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "shutdown" -> {
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
            }
            else -> result.notImplemented()
        }
    }
}
