import 'package:flutter/services.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/01/29 4:02 PM
/// @Describe:

class ChannelUtils {
  static const String _channelName = 'com.lwh.widget.demo/method';
  static ChannelUtils _instance;

  factory ChannelUtils() => _getInstance();

  static ChannelUtils _getInstance() {
    if (_instance == null) {
      _instance = ChannelUtils._internal();
    }
    return _instance;
  }

  MethodChannel _methodChannel;

  ChannelUtils._internal() {
    _methodChannel = MethodChannel(_channelName);
  }

  /// Android退出程序
  Future<bool> exitApp() async {
    try {
      final bool isSuccess = await _methodChannel.invokeMethod('exitApp');
      return isSuccess;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
