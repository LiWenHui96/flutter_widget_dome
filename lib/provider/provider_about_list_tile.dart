import 'package:flutter_widget_demo/provider/provider_base.dart';
import 'package:package_info/package_info.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/01 11:46 AM
/// @Describe: 

class AboutListTileProvider extends BaseProvider {
  PackageInfo _packageInfo;
  String _appName = "";
  String _version = "";

  AboutListTileProvider() {
    getPackageInfo();
  }

  PackageInfo get packageInfo => _packageInfo;

  get appName => _appName;

  get version => _version;

  getPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
    _appName = _packageInfo.appName;
    _version = _packageInfo.version;

    notifyListeners();
  }
}