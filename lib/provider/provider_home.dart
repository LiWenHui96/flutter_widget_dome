import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_widget_demo/model/model.dart';
import 'package:flutter_widget_demo/provider/provider_base.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/01/29 3:06 PM
/// @Describe:

class HomeProvider extends BaseProvider {
  List<WidgetInfoModel> _widgetInfoList = [];

  HomeProvider() {
    setWidgetInfoList();
  }

  List<WidgetInfoModel> get widgetInfoList => _widgetInfoList;

  Future<void> setWidgetInfoList() async {
    var jsonString =
        await rootBundle.loadString("assets/json/widget_list.json");

    var jsonData = json.decode(jsonString);

    if (jsonData != null) {
      jsonData.forEach((v) {
        _widgetInfoList.add(WidgetInfoModel.fromJson(v));
      });
    }

    notifyListeners();
  }
}
