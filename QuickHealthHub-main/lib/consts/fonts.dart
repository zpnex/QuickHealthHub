import 'package:qhhub/consts/consts.dart';

class AppFonts {
  static String nunito = "nunito", nunitoBold = "nunito_Bold";
}

class AppSizes {
  static const size12 = 12,
      size14 = 14.0,
      size16 = 16.0,
      size18 = 18.0,
      size20 = 20.0,
      size22 = 22.0,
      size24 = 24.0,
      size34 = 34.0;
}

class AppStyles {
  static normal({String? title, Color? color = Colors.grey, double? size}) {
   return title!.text.size(size).color(color).make();
  }

  static bold({String? title, Color? color = Colors.grey, double? size}) {
   return title!.text.size(size).color(color).fontFamily(AppFonts.nunitoBold).make();
  }
}
