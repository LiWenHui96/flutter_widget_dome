import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';
import 'package:flutter_widget_demo/provider/provider.dart';
import 'package:provider/provider.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/01 11:01 AM
/// @Describe: 此控件通常不会使用，通常会设置一个单独的“关于页面”
///            http://laomengit.com/flutter/widgets/AboutListTile.html

class AboutListTileWidgetPage extends StatefulWidget {
  final String title;

  const AboutListTileWidgetPage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _AboutListTileWidgetPageState createState() =>
      _AboutListTileWidgetPageState(this.title);
}

class _AboutListTileWidgetPageState extends BaseState<AboutListTileWidgetPage> {
  final String title;

  _AboutListTileWidgetPageState(this.title);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.bodyText2;

    return ChangeNotifierProvider(
      create: (_) => AboutListTileProvider(),
      child: Consumer<AboutListTileProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                this.title,
              ),
            ),
            body: Container(
              child: AboutListTile(
                icon: FlutterLogo(),
                child: Text("关于 ${provider.appName ?? ""}"),
                applicationIcon: FlutterLogo(),
                applicationName: provider.appName ?? "",
                applicationVersion: provider.version ?? "",
                applicationLegalese: "copyright LWH",
                aboutBoxChildren: [
                  SizedBox(height: 24),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          style: textStyle,
                          text: "Flutter 是 Google的开源工具包",
                        ),
                        TextSpan(
                          style: textStyle.copyWith(
                              color: Theme.of(context).accentColor),
                          text: "https://flutter.dev",
                        ),
                        TextSpan(
                          style: textStyle,
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                ],
                dense: false,
              ),
            ),
          );
        },
      ),
    );
  }
}
