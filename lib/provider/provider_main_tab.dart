import 'package:flutter_widget_demo/provider/provider_base.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/01/29 3:13 PM
/// @Describe: 

class MainTabProvider extends BaseProvider {
  static const refreshId = 'MainInfoProvider';

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;

    notifyListeners();
  }
}