import 'package:flutter/material.dart';

class ColorType {
  static const primary = 2;
  static const light = 0;
  static const dark = 4;
}

class AppColors {
  const AppColors._();
  // primary
  static const greenishTeal = Color(0xff32C791);
  static const greenDark = Color(0xff00A162);
  static const waterleaf = Color(0xffA5EDD3);
  static const iceberg = Color(0xffDCF6ED);

  // dark
  static const blackOnyx = Color(0xff121212);
  static const greyNero = Color(0xff282828);

  // grey
  static const greyCharcoal = Color(0xff333333);
  static const greyBattleship = Color(0xff828282);
  static const greySoul = Color(0xffB3B3B3);
  static const greyDawn = Color(0xffEBEBEB);
  static const alabaster = Color(0xffFAFAFA);
  static const white = Colors.white;

  // utility
  static const blueOcean = [
    Color(0xffECFBFF),
    Color(0xff86E4F8),
    Color(0xff0CC8F1),
    Color(0xff088CA9),
    Color(0xff055060),
  ];

  static const greenPrimary = [
    Color(0xffEFFEF9),
    Color(0xffA0FEDC),
    Color(0xff38D89E),
    Color(0xff238B66),
    Color(0xff14503A),
  ];

  static const purplePlum = [
    Color(0xffF9F3FF),
    Color(0xffC483CC),
    Color(0xffAA4EB6),
    Color(0xff883E92),
    Color(0xff55275B),
  ];

  static const redCranberry = [
    Color(0xffFFF4F8),
    Color(0xffF0A5BB),
    Color(0xffE34A76),
    Color(0xffB63B5E),
    Color(0xff882C47),
  ];

  static const orangeTangerine = [
    Color(0xffFFF5E7),
    Color(0xffFFC980),
    Color(0xffFF9200),
    Color(0xffB36600),
    Color(0xff804900),
  ];

  static const yellowSunny = [
    Color(0xffFFFAE7),
    Color(0xffFEDE80),
    Color(0xffFDBC00),
    Color(0xffBB9431),
    Color(0xff7F692F),
  ];

  static const peachSkin = [
    Color(0xffFFFAE7),
    Color(0xffFEDE80),
    Color(0xffF7BD9D),
    Color(0xffF2B6A4),
    Color(0xffEC9182),
  ];

  // logo
  static const logoLight = Color(0xffe0e0e0);
  static const logoDark = Color(0xff282828);
  static const logoOrange = Color(0xffff7300);

  // error
  static const redCardinal = Color(0xffC41334);

  // material
  static const Map<int, Color> greenDarkPalette = {
    50: Color.fromRGBO(0, 161, 98, .1),
    100: Color.fromRGBO(0, 161, 98, .2),
    200: Color.fromRGBO(0, 161, 98, .3),
    300: Color.fromRGBO(0, 161, 98, .4),
    400: Color.fromRGBO(0, 161, 98, .5),
    500: Color.fromRGBO(0, 161, 98, .6),
    600: Color.fromRGBO(0, 161, 98, .7),
    700: Color.fromRGBO(0, 161, 98, .8),
    800: Color.fromRGBO(0, 161, 98, .9),
    900: Color.fromRGBO(0, 161, 98, 1),
  };
  static const MaterialColor greenDarkMaterial = MaterialColor(
    0xff00A162,
    greenDarkPalette,
  );
}
