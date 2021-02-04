import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';
import 'package:flutter_widget_demo/ui/ui.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/02 3:11 PM
/// @Describe: 

class ChoiceChipWidgetPage extends StatefulWidget {
  @override
  _ChoiceChipWidgetPageState createState() => _ChoiceChipWidgetPageState();
}

class _ChoiceChipWidgetPageState extends BaseState<ChoiceChipWidgetPage> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: size(10),
        right: size(10),
      ),
      child: Wrap(
        spacing: 15,
        children: List.generate(10, (index) {
          return ChoiceChip(
            label: Text("LWH $index"),
            padding: EdgeInsets.symmetric(
              horizontal: 0,
            ),
            selected: _selectIndex == index,
            onSelected: (v) {
              setState(() {
                _selectIndex = index;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}