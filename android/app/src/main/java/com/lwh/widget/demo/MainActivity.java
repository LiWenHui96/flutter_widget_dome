package com.lwh.widget.demo;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  public static MainActivity instance;
  public static FlutterEngine mFlutterEngine;

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    mFlutterEngine = flutterEngine;
    GeneratedPluginRegistrant.registerWith(flutterEngine);
  }

  @Override
  public void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    instance = this;

    // 初始化方法调用处理器
    MethodInvokeHandler.init();
  }
}
