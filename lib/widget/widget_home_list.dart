import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/model/model.dart';
import 'package:flutter_widget_demo/ui/ui.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/01 9:27 AM
/// @Describe: 

class HomeListWidget extends StatelessWidget {
  final WidgetInfoModel widgetInfoModel;
  final Function onTap;

  HomeListWidget({
    Key key,
    @required this.widgetInfoModel,
    this.onTap,
  }) :super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? null : () {
        if (onTap != null) {
          onTap(widgetInfoModel);
        }
      },
      child: Container(
        height: size(80),
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          border: Border(
            bottom: BorderSide(
              color: Color(0xFF999999),
              width: 0.5,
            ),
          ),
        ),
        padding: EdgeInsets.only(left: size(20), right: size(20),),
        child: Row(
          children: [
            Text(
              widgetInfoModel.title,
            ),
          ],
        ),
      ),
    );
  }}
