package com.lwh.widget.demo.utils;

import android.app.Activity;
import android.graphics.Color;
import android.os.Build;
import android.view.View;
import android.view.WindowManager;

/**
 * @Author: LWH
 * @Host: liwenhui
 * @Date: 2021/01/29 5:16 PM
 * @Describe:
 */
public class CommonUtils {
  /**
   * 设置状态栏颜色
   */
  public static void setStatusColor(Activity activity, int color, boolean isDark) {
    if (color == Color.TRANSPARENT) {
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
        activity.getWindow().getDecorView().setSystemUiVisibility(
          View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
      }
    }

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      // 5.0 以上全透明状态栏
      // 取消设置透明状态栏,使 ContentView 内容不再覆盖状态栏
      // 加下面几句可以去除透明状态栏的灰色阴影,实现纯透明
      activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
      // 需要设置这个 flag 才能调用 setStatusBarColor 来设置状态栏颜色
      activity.getWindow().addFlags(
        WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
      activity.getWindow().getDecorView().setSystemUiVisibility(
        View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);

      // 6.0 以上可以设置状态栏的字体为黑色.使用下面注释的这行打开亮色状态栏模式,实现黑色字体,
      // 白底的需求用这句setStatusBarColor(Color.WHITE);
      activity.getWindow().setStatusBarColor(color);
    } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {//4.4 全透明状态栏
      activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
    }

    if (isDark) {
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        View decorView = activity.getWindow().getDecorView();
        // 重点：SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
        int option = View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
        decorView.setSystemUiVisibility(option);
      }
    } else {
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        View decorView = activity.getWindow().getDecorView();
        // 重点：SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
        int option = View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE;
        decorView.setSystemUiVisibility(option);
      }
    }
  }
}
