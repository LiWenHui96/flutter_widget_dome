import 'dart:ui';

import 'package:flutter/material.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/01 9:21 AM
/// @Describe:

/// *注 App 的第一个页面不要用此工具

/// 屏幕适配工具   使用今日头条的固定宽度适配方案, 可实现在不同设备中界面观感的基本一致
/// 配置好设计图尺寸后在编写布局时可使用[size]方法进行实际尺寸的本地计算,
/// 参数传入设计图设计尺寸(单位: 像素)即可

class ScreenAdaptUtils {
  // 设备像素密度
  static double _devicePixelRatio = 0;
  static double _devicePhysicalPixelWidth = 0;
  static const int _designWidthInPixel = 750;
  static double _statusBarHeight = 0;

  static double _textScaleFactor;

  static void _init() {
    if (_devicePixelRatio != 0 && _devicePhysicalPixelWidth != 0) {
      return;
    }
    MediaQueryData data = MediaQueryData.fromWindow(window);
    _devicePixelRatio = data.devicePixelRatio;
    _statusBarHeight = data.padding.top;
    _devicePhysicalPixelWidth = window.physicalSize.width;

    _textScaleFactor = data.textScaleFactor;
  }

  /// 计算当前设备理想显示时的实际尺寸
  static double px(int designPx) {
    _init();
    return (designPx / _designWidthInPixel * _devicePhysicalPixelWidth) /
        _devicePixelRatio;
  }

  /// 获取状态栏高度
  static double getStatusBarHeight() {
    _init();
    return _statusBarHeight;
  }

  /// 实际字体尺寸，不随系统字体大小变化
  static double fontPx(int designPx) {
    return px(designPx) / _textScaleFactor;
  }
}

/// 快捷方式..
double size(int px) {
  return ScreenAdaptUtils.px(px);
}

/// 快捷方式..
double fontSize(int px) {
  return ScreenAdaptUtils.fontPx(px);
}
