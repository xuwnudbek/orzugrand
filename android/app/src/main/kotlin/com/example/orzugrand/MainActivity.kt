package com.example.orzugrand

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity : FlutterFragmentActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MapKitFactory.setApiKey("0d7c8452-1f22-4351-a98e-f1bcb1a728cd") // Your generated API key
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}