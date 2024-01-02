import 'package:qhhub/consts/consts.dart';

class AppFonts {
  static String nunito = "nunito", nunitoBold = "nunito_Bold";
}

class AppSizes {
  static const size12 = 12,
      size14 = 14,
      size16 = 16,
      size18 = 18,
      size20 = 20,
      size22 = 22,
      size24 = 24,
      size34 = 34;
}

class AppStyles {
  static normal({String? title, Color? color = Colors.grey, double? size}) {
    title!.text.size(size).color(color).make();
  }

  static bold({String? title, Color? color = Colors.grey, double? size}) {
    title!.text.size(size).color(color).fontFamily(AppFonts.nunitoBold).make();
  }
}
