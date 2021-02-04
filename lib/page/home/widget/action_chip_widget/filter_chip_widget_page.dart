import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';
import 'package:flutter_widget_demo/ui/ui.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/02 3:41 PM
/// @Describe: 

class FilterChipWidgetPage extends StatefulWidget {
  @override
  _FilterChipWidgetPageState createState() => _FilterChipWidgetPageState();
}

class _FilterChipWidgetPageState extends BaseState<FilterChipWidgetPage> {
  List<String> _filters = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: size(10),
        right: size(10),
      ),
      child: Column(
        children: <Widget>[
          Wrap(
            spacing: 15,
            children: List.generate(10, (index) {
              return FilterChip(
                label: Text("LWH $index"),
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                ),
                selected: _filters.contains("$index"),
                onSelected: (v) {
                  setState(() {
                    if(v){
                      _filters.add("$index");
                    }else{
                      _filters.removeWhere((f){
                        return f == "$index";
                      });
                    }
                  });
                },
              );
            }).toList(),
          ),
          Text("选中：${_filters.join(",")}"),
        ],
      ),
    );
  }
}