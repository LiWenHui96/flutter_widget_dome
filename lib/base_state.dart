import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/util/util.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/01/29 2:41 PM
/// @Describe: 

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  String pageName = T.toString();

  @override
  void initState() {
    super.initState();

    debugPrint('================= ${this.pageName} ====== OPEN  ========');
  }

  void showToast(String msg) {
    CommonUtils.showToast(msg);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @protected
  void dispose() {
    debugPrint('================= ${this.pageName} ====== CLOSE ========');

    super.dispose();
  }

  @protected
  void jumpPage(Future Function() jump) async {
    onPagePause();
    await jump();
    onPageResume();
  }

  @protected
  void onPagePause() {}

  @protected
  void onPageResume() {}
}
