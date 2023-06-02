package com.example.orzugrand

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory
import androidx.annotation.NonNull

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("928432e8-00a6-4fae-97b7-7af64fea329b") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}