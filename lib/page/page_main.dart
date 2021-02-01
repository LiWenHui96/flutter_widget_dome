import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';
import 'package:flutter_widget_demo/page/home/page_home.dart';
import 'package:flutter_widget_demo/page/mine/page_mine.dart';
import 'package:flutter_widget_demo/provider/provider.dart';
import 'package:flutter_widget_demo/util/util.dart';
import 'package:provider/provider.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/01/29 12:17 PM
/// @Describe:

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainTabProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MainPage(),
        ));
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends BaseState<MainPage> {
  List<Widget> _tabPageList;

  var _iconAssets = const <List<String>>[
    [
      'images/bottom_bar_home_selected.png',
      'images/bottom_bar_home.png',
      '首页',
    ],
    [
      'images/bottom_bar_mine_selected.png',
      'images/bottom_bar_mine.png',
      '我的',
    ],
  ];

  @override
  void initState() {
    super.initState();

    _tabPageList = <Widget>[
      HomePage(),
      MinePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        doubleClickBack();
        return false;
      },
      child: Consumer<MainTabProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Flutter Widget"
              ),
            ),
            body: IndexedStack(
              index: provider.currentIndex,
              children: _tabPageList,
            ),
            bottomNavigationBar: CupertinoTabBar(
              currentIndex: provider.currentIndex,
              items: _getTabItems(provider.currentIndex),
              backgroundColor: Colors.white,
              onTap: (index) {
                provider.currentIndex = index;
              },
            ),
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _getTabItems(int _currentIndex) {
    var list = List<BottomNavigationBarItem>();
    for (int i = 0; i < _iconAssets.length; i++) {
      list.add(_buildTabItem(i, _currentIndex));
    }
    return list;
  }

  BottomNavigationBarItem _buildTabItem(int index, int _currentIndex) {
    return BottomNavigationBarItem(
      icon: _buildTabIcon(index, false),
      activeIcon: _buildTabIcon(index, true),
      label: _iconAssets[index][2],
    );
  }

  Widget _buildTabIcon(int index, bool active) {
    return Image.asset(
      active ? _iconAssets[index][0] : _iconAssets[index][1],
      height: 20,
      width: 20,
    );
  }

  // 用于存放上一点击'返回键'的时刻
  int mExitTime = 0;

  void doubleClickBack() {
    int now = DateTime.now().millisecondsSinceEpoch;

    if (now - mExitTime > 2000) {
      mExitTime = DateTime.now().millisecondsSinceEpoch;
      showToast('再按一次退出程序');
    } else {
      CommonUtils.hideToast();
      ChannelUtils().exitApp();
    }
  }
}
