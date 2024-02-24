import 'dart:ui';

class AppColor {
  static const Color primary = Color.fromRGBO(55, 158, 85, 1);
  static const Color appBGLight = Color.fromRGBO(0, 112, 94, 1);
  static const Color appBGDark = Color.fromRGBO(0, 82, 71, 1);
  static const Color appTextDark = Color.fromRGBO(36, 24, 35, 1);
  static const Color appTextStrong1 = Color.fromRGBO(195, 82, 87, 1);
  static const Color appTextStrong2 = Color.fromRGBO(241, 122, 120, 1);
  static const Color itemBGLight = Color.fromRGBO(255, 233, 208, 1);
  static const Color itemBGDark = Color.fromRGBO(223, 224, 223, 1);
}

extension AppTextStyle on TextStyle {
  TextStyle get itemTitle => TextStyle(
      color: AppColor.appTextStrong1,
      fontSize: 16,
      fontWeight: FontWeight.normal);
  TextStyle get itemCount => TextStyle(
      color: AppColor.appTextStrong1,
      fontSize: 20,
      fontWeight: FontWeight.bold);
}
