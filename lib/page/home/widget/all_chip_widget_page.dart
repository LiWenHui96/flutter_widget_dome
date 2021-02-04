import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';
import 'package:flutter_widget_demo/page/home/widget/action_chip_widget/action_chip_widget.dart';
import 'package:flutter_widget_demo/ui/ui.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/02 9:53 AM
/// @Describe:

class AllChipWidgetPage extends StatefulWidget {
  final String title;

  const AllChipWidgetPage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _AllChipWidgetPageState createState() => _AllChipWidgetPageState(this.title);
}

class _AllChipWidgetPageState extends BaseState<AllChipWidgetPage>
    with SingleTickerProviderStateMixin {
  final String title;

  /// Tab文字
  static const _tabs = ["RawChip", "Chip", "InputChip", "ChoiceChip", "FilterChip", "ActionChip"];

  TabController _tabController;

  _AllChipWidgetPageState(this.title);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.title,
        ),
        bottom: TabBar(
          tabs: _tabs.map((f) {
            return Text(f);
          }).toList(),
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: ColorsUi.text_dark,
          indicatorColor: Colors.white,
          indicatorWeight: 1.0,
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          RawChipWidgetPage(),
          ChipWidgetPage(),
          InputChipWidgetPage(),
          ChoiceChipWidgetPage(),
          FilterChipWidgetPage(),
          ActionChipWidgetPage(),
        ],
      ),
    );
  }
}
