import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/01 9:44 AM
/// @Describe: 

class AboutDialogWidgetPage extends StatefulWidget {
  @override
  _AboutDialogWidgetPageState createState() => _AboutDialogWidgetPageState();
}

class _AboutDialogWidgetPageState extends BaseState<AboutDialogWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AboutDialog"),
      ),
      body: Container(),
    );
  }
}
