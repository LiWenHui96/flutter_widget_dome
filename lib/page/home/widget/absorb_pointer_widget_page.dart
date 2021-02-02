import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';
import 'package:flutter_widget_demo/ui/ui.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/02 9:35 AM
/// @Describe: 1、根据业务需求禁用/启用多个组件。
///            2、根据业务需求禁用/启用整个App。
///            http://laomengit.com/flutter/widgets/AbsorbPointer.html

class AbsorbPointerWidgetPage extends StatefulWidget {
  final String title;

  const AbsorbPointerWidgetPage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _AbsorbPointerWidgetPageState createState() =>
      _AbsorbPointerWidgetPageState(this.title);
}

class _AbsorbPointerWidgetPageState extends BaseState<AbsorbPointerWidgetPage> {
  final String title;

  _AbsorbPointerWidgetPageState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.title,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Listener(
                  onPointerDown: (v) {
                    print("click red");
                  },
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Listener(
                  onPointerDown: (v) {
                    print("click blue self");
                  },
                  child: AbsorbPointer(
                    child: Listener(
                      onPointerDown: (v) {
                        print("click blue child");
                      },
                      child: Container(
                        color: Colors.blue,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size(20),
          ),
          Container(
            height: 200,
            width: 200,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Listener(
                  onPointerDown: (v) {
                    print("click red");
                  },
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Listener(
                  onPointerDown: (v) {
                    print("click blue self");
                  },
                  child: IgnorePointer(
                    child: Listener(
                      onPointerDown: (v) {
                        print("click blue child");
                      },
                      child: Container(
                        color: Colors.blue,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
