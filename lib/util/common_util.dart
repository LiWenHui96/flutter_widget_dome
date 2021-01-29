import 'package:fluttertoast/fluttertoast.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/01/29 3:01 PM
/// @Describe: 

class CommonUtils {
  /// Toast
  static void showToast(String msg, {bool isLong = false}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: isLong ? 2 : 1
    );
  }

  static void hideToast() {
    Fluttertoast.cancel();
  }
}