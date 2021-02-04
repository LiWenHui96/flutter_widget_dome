import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';
import 'package:flutter_widget_demo/ui/ui.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/02 2:18 PM
/// @Describe:

class ChipWidgetPage extends StatefulWidget {
  @override
  _ChipWidgetPageState createState() => _ChipWidgetPageState();
}

class _ChipWidgetPageState extends BaseState<ChipWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: size(10),
        right: size(10),
      ),
      child: ListView(
        children: [
          Row(
            children: [
              Text(
                "基础使用：",
              ),
              Chip(
                label: Text(
                  "LWH",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "左侧图标：",
              ),
              Chip(
                avatar: CircleAvatar(
                  child: Text("H"),
                ),
                label: Text(
                  "LWH",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "label样式：",
              ),
              Chip(
                label: Text("LWH"),
                labelStyle: TextStyle(color: ColorsUi.themeColor),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: size(20),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "删除属性：",
              ),
              Chip(
                label: Text("LWH"),
                onDeleted: () {
                  print("onDeleted");
                },
                deleteIcon: Icon(Icons.delete),
                deleteIconColor: Colors.red,
                deleteButtonTooltipMessage: "删除",
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "整体样式：",
              ),
              Chip(
                label: Text("LWH"),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size(16))),
                backgroundColor: ColorsUi.themeColor,
                padding: EdgeInsets.symmetric(
                  vertical: size(10),
                  horizontal: size(20),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "阴影属性：",
              ),
              Chip(
                label: Text("LWH"),
                elevation: 8,
                shadowColor: ColorsUi.themeColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
