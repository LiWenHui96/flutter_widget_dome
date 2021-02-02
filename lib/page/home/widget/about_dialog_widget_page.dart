import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';
import 'package:flutter_widget_demo/ui/ui.dart';
import 'package:package_info/package_info.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/01 9:44 AM
/// @Describe: AboutDialog 演示Demo

class AboutDialogWidgetPage extends StatefulWidget {
  final String title;

  const AboutDialogWidgetPage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _AboutDialogWidgetPageState createState() => _AboutDialogWidgetPageState(this.title);
}

class _AboutDialogWidgetPageState extends BaseState<AboutDialogWidgetPage> {
  final String title;

  _AboutDialogWidgetPageState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title,),
      ),
      body: Container(
        width: double.infinity,
        height: size(80),
        margin: EdgeInsets.all(size(20)),
        decoration: BoxDecoration(
          color: ColorsUi.themeColor,
          borderRadius: BorderRadius.circular(size(20)),
        ),
        child: FlatButton(
          child: Text(
            "打开",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: _openAboutDialog,
        ),
      ),
    );
  }

  _openAboutDialog() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    showAboutDialog(
      context: context,
      applicationIcon: FlutterLogo(),
      applicationName: packageInfo.appName,
      applicationVersion: packageInfo.version,
      applicationLegalese: "copyright LWH",
      children: <Widget>[
        Container(
          height: 30,
          color: Colors.red,
        ),
        Container(
          height: 30,
          color: Colors.blue,
        ),
        Container(
          height: 30,
          color: Colors.green,
        ),
      ],
    );
  }
}
