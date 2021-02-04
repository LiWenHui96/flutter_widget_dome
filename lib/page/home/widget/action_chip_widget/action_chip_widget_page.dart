import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';
import 'package:flutter_widget_demo/ui/ui.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/02 2:18 PM
/// @Describe:

class ActionChipWidgetPage extends StatefulWidget {
  @override
  _ActionChipWidgetPageState createState() => _ActionChipWidgetPageState();
}

class _ActionChipWidgetPageState extends BaseState<ActionChipWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: size(10),
        right: size(10),
      ),
      child: ActionChip(
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text("H"),
        ),
        label: Text("LWH"),
        onPressed: () {
          print("onPressed");
        },
      ),
    );
  }
}
