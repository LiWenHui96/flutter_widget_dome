import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';
import 'package:flutter_widget_demo/ui/ui.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/02 2:31 PM
/// @Describe:

class InputChipWidgetPage extends StatefulWidget {
  @override
  _InputChipWidgetPageState createState() => _InputChipWidgetPageState();
}

class _InputChipWidgetPageState extends BaseState<InputChipWidgetPage> {
  bool _selected = false;

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
              InputChip(
                label: Text(
                  "LWH",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "禁用状态：",
              ),
              InputChip(
                label: Text(
                  "LWH",
                ),
                isEnabled: false,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "左侧图标：",
              ),
              InputChip(
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
              InputChip(
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
              InputChip(
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
              InputChip(
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
              InputChip(
                label: Text("LWH"),
                elevation: 8,
                shadowColor: ColorsUi.themeColor,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "选中/未选中样式：",
              ),
              InputChip(
                label: Text("LWH"),
                labelStyle: TextStyle(
                  color: _selected ? Colors.white : ColorsUi.text_dark,
                ),
                // ①
                showCheckmark: false,
                avatar: Icon(
                  _selected ? Icons.check : Icons.clear_outlined,
                  color: _selected ? Colors.white : ColorsUi.text_dark,
                ),
                selected: _selected,
                onSelected: (v) {
                  setState(() {
                    _selected = v;
                  });
                },
                selectedColor: ColorsUi.themeColor,
                selectedShadowColor: Colors.red,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "点击属性：",
              ),
              InputChip(
                label: Text("LWH"),
                onPressed: (){
                  print('onPressed');
                },
                pressElevation: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
