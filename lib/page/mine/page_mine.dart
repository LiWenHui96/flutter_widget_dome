import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/01/29 3:17 PM
/// @Describe:

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends BaseState<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("我的"),
      ),
    );
  }
}
