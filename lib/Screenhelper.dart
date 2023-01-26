/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/src/rendering/box.dart';

///屏幕缩放插件
class ScreenHelper {
  ///静态初始化方法
  static int(BuildContext context) {
    */
/*ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize:Size(375, 812),//这里传入你蓝湖等上面设计图的大小
        context: context,//老版本可能不用传这个 新版本这个必传 要不然会报问题
        orientation: Orientation.portrait);
  }*//*
}

  static double get divider => height(2);

  /// 页面内边距
  static EdgeInsetsGeometry get pagePadding {
    return EdgeInsets.symmetric(
      horizontal: pageHorizontalPadding(),
      vertical: pageVerticalPadding(),
    );
  }

  /// 页面水平内边距
  static pageHorizontalPadding() => width(30);

  /// 页面垂直内边距
  static pageVerticalPadding() => width(20);

  ///列表item水平内边距
  static listHorizontalPadding() => width(20);

  ///列表item垂直内边距
  static listVerticalPadding() => width(30);

  /// 获取 计算后的字体
  static sp(double v, {bool allowFontScalingSelf = false}) {
    return v.sp;
  }

  /// 获取 计算后的高度
  static height(double value) {
    return value.h;
  }

  /// 获取 计算后的宽度
  static width(double value) {
    return value.w;
  }

  /// 获取 计算后的屏幕高度
  static double get screenHeight {
    return 1.sh;
  }

  /// 获取 计算后的屏幕高度
  static double get screenWidth {
    return 1.sw;
  }

  static double? get scale {
    return ScreenUtil().pixelRatio;
  }

  static double get textScaleFactor {
    return ScreenUtil().textScaleFactor;
  }

  ///顶部导航栏高度= 状态栏高度 + Appbar高度
  static double get TopBarHeight {
    return ScreenUtil().statusBarHeight + kToolbarHeight;
  }

  static double get topSafeHeight {
    return ScreenUtil().statusBarHeight;
  }

  static double get bottomSafeHeight {
    return ScreenUtil().bottomBarHeight;
  }
}*/
