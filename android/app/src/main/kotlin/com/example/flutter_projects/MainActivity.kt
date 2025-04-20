package com.example.flutter_projects

import android.content.Context
import android.content.pm.PackageManager
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.util.Log
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity() {
    private val CHANNEL = "apk_channel"
    private val TAG = "MainActivity"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "installApk" -> {
                    val apkPath = call.argument<String>("apkPath")
                    Log.d(TAG, "Received installApk request for path: $apkPath")

                    apkPath?.let {
                        try {
                            val file = File(it)
                            if (!file.exists()) {
                                Log.e(TAG, "APK file does not exist at path: $it")
                                result.error("FILE_NOT_FOUND", "APK file does not exist", null)
                                return@setMethodCallHandler
                            }

                            if (file.length() == 0L) {
                                Log.e(TAG, "APK file is empty at path: $it")
                                result.error("EMPTY_FILE", "APK file is empty", null)
                                return@setMethodCallHandler
                            }

                            Log.d(TAG, "APK file exists and is not empty, size: ${file.length()} bytes")
                            installApk(file)
                            result.success("Installation intent launched")
                        } catch (e: Exception) {
                            Log.e(TAG, "Error installing APK: ${e.message}", e)
                            result.error("INSTALLATION_ERROR", e.message, null)
                        }
                    } ?: run {
                        Log.e(TAG, "APK path is null")
                        result.error("INVALID_PATH", "APK path is null", null)
                    }
                }

                "isAppInstalled" -> {
                    val packageName = call.argument<String>("package")
                    val isInstalled = isPackageInstalled(packageName ?: "", applicationContext)
                    result.success(isInstalled)
                }

                "openApp" -> {
                    val packageName = call.argument<String>("package")
                    openInstalledApp(packageName ?: "", applicationContext)
                    result.success(null)
                }

                else -> {
                    Log.w(TAG, "Unknown method called: ${call.method}")
                    result.notImplemented()
                }
            }
        }
    }

    private fun installApk(file: File) {
        Log.d(TAG, "Installing APK from file: ${file.absolutePath}")
        val context = this
        val intent = Intent(Intent.ACTION_VIEW)
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_GRANT_READ_URI_PERMISSION

        val apkUri: Uri = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            Log.d(TAG, "Using FileProvider for Android N and above")
            FileProvider.getUriForFile(context, "${context.packageName}.fileprovider", file)
        } else {
            Log.d(TAG, "Using direct file URI for Android below N")
            Uri.fromFile(file)
        }

        Log.d(TAG, "APK URI: $apkUri")
        intent.setDataAndType(apkUri, "application/vnd.android.package-archive")

        try {
            Log.d(TAG, "Starting installation activity")
            context.startActivity(intent)
            Log.d(TAG, "Installation activity started successfully")
        } catch (e: Exception) {
            Log.e(TAG, "Error starting installation activity: ${e.message}", e)
            // Try to open settings to enable unknown sources
            try {
                Log.d(TAG, "Attempting to open security settings")
                val settingsIntent = Intent(android.provider.Settings.ACTION_SECURITY_SETTINGS)
                settingsIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                context.startActivity(settingsIntent)
            } catch (e2: Exception) {
                Log.e(TAG, "Error opening security settings: ${e2.message}", e2)
            }
        }
    }

    private fun isPackageInstalled(packageName: String, context: Context): Boolean {
        return try {
            context.packageManager.getPackageInfo(packageName, 0)
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }

    private fun openInstalledApp(packageName: String, context: Context) {
        val launchIntent = context.packageManager.getLaunchIntentForPackage(packageName)
        if (launchIntent != null) {
            context.startActivity(launchIntent)
        } else {
            Log.e(TAG, "Unable to launch app: $packageName")
        }
    }
}
