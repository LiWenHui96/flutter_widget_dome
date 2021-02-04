import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';
import 'package:flutter_widget_demo/page/home/widget/widgets.dart';
import 'package:flutter_widget_demo/provider/provider.dart';
import 'package:flutter_widget_demo/util/util.dart';
import 'package:flutter_widget_demo/widget/widget.dart';
import 'package:provider/provider.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/01/29 3:16 PM
/// @Describe:

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  HomeProvider _provider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          this._provider = provider;

          return Container(
            child: ListView.builder(
              itemCount: _provider.widgetInfoList.length,
              itemBuilder: (c, index) {
                return HomeListWidget(
                  widgetInfoModel: _provider.widgetInfoList[index],
                  onTap: (model) async {
                    await _openPage(model.type);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  _openPage(type) async {
    switch (type) {
      case "AboutDialog":
        await _navigatorToAboutDialogWidgetPage(type);
        break;
      case "AboutListTile":
        await _navigatorToAboutListTileWidgetPage(type);
        break;
      case "AbsorbPointer":
        await _navigatorToAbsorbPointerWidgetPage(type);
        break;
      case "AllChip":
        await _navigatorToAllChipWidgetPage(type);
        break;
    }
  }

  /// AboutDialogWidgetPage
  _navigatorToAboutDialogWidgetPage(String title) async {
    await RouterUtil.pushWidget(
      context, AboutDialogWidgetPage(title: title,),
    );
  }

  /// AboutListTileWidgetPage
  _navigatorToAboutListTileWidgetPage(String title) async {
    await RouterUtil.pushWidget(
      context, AboutListTileWidgetPage(title: title,),
    );
  }

  /// AbsorbPointerWidgetPage
  _navigatorToAbsorbPointerWidgetPage(String title) async {
    await RouterUtil.pushWidget(
      context, AbsorbPointerWidgetPage(title: title,),
    );
  }

  /// AllChipWidgetPage
  _navigatorToAllChipWidgetPage(String title) async {
    await RouterUtil.pushWidget(
      context, AllChipWidgetPage(title: title,),
    );
  }
}
