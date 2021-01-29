package com.lwh.widget.demo;

import android.content.pm.ActivityInfo;
import android.graphics.Color;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.lwh.widget.demo.utils.CommonUtils;

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

    //设置竖屏模式
    setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

    // 沉浸式状态栏
    CommonUtils.setStatusColor(this, Color.TRANSPARENT, false);

    // 初始化方法调用处理器
    MethodInvokeHandler.init();
  }
}
