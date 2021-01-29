package com.lwh.widget.demo;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * @Author: LWH
 * @Host: liwenhui
 * @Date: 2021/01/29 4:35 PM
 * @Describe:
 */
public class MethodInvokeHandler {
  /**
   * 方法通道名称
   */
  private static final String CHANNEL_NAME = "com.lwh.widget.demo/method";

  /**
   * 方法名-退出App
   */
  private static final String METHOD_EXIT = "exitApp";

  private static MethodInvokeHandler instance;

  private MethodInvokeHandler() {
  }

  private static synchronized MethodInvokeHandler getInstance() {
    if (instance == null) {
      instance = new MethodInvokeHandler();

    }
    return instance;
  }

  /**
   * 初始化
   */
  static void init() {
    new MethodChannel(MainActivity.mFlutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL_NAME)
      .setMethodCallHandler((methodCall, result) ->
        getInstance().handleMethodInvoke(methodCall, result));
  }

  /**
   * 处理方法调用
   *
   * @param methodCall 方法调用
   * @param result     方法返回
   */
  private void handleMethodInvoke(MethodCall methodCall, MethodChannel.Result result) {
    switch (methodCall.method) {
      case METHOD_EXIT:
        MainActivity.instance.finish();
        break;
    }
  }
}
