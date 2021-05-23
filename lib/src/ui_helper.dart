import 'package:flutter/material.dart';

class UiH {
  static UiH? _instance;
  factory UiH() => _instance ??= new UiH._();

  UiH._();
  static MediaQueryData? _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static Orientation? orientation;
  static double constWidth = 414.0; // 414 is the layout width that designer use
  static double constHeight =
      896.0; // 896 is the layout height that designer use

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }

  // Get the proportionate height as per the screen size
  static bool isSmallDevice() {
    if ((UiH.screenHeight < 700)) {
      return true;
    } else {
      return false;
    }
  }

  /// Get the proportionate SizedBox with Height as per the screen size. [horizontalSpacer]
  /// [multiplyBy] is an optional value which is `1` by default and when this param
  /// is passed, the [horizontalSpacer] value will be `multiplied` by it.
  /// Example : `{int multiplyBy: 2}` will give a value of `20` if `default width`
  /// is `10` as per the `formula` for consistancy.
  /// [NOTE] : `Negative` values will be automatically converted to `Positive` values for [multiplyBy] option.
  static Widget horizontalSpacer({int multiplyBy: 1}) => SizedBox(
      height: getProportionateScreenWidth(UiH.screenWidth) *
          0.01 *
          multiplyBy.abs());

  /// Get the proportionate SizedBox with Height as per the screen size. [verticalSpacer]
  /// [multiplyBy] is an optional value which is `1` by default and when this param
  /// is passed, the [verticalSpacer] value will be `multiplied` by it.
  /// Example : `{int multiplyBy: 2}` will give a value of `20` if `default height`
  /// is `10` as per the `formula` for consistancy.
  /// [NOTE] : `Negative` values will be automatically converted to `Positive` values for [multiplyBy] option.
  static Widget verticalSpacer({int multiplyBy: 1}) => SizedBox(
      height: getProportionateScreenHeight(UiH.screenHeight) *
          0.01 *
          multiplyBy.abs());

  /// Get the proportionate height as per the screen size [getProportionateScreenHeight]
  static double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = UiH.screenHeight;
    return (inputHeight / UiH.constHeight) * screenHeight;
  }

  // Get the proportionate width as per the screen size
  static double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = UiH.screenWidth;
    return (inputWidth / UiH.constWidth) * screenWidth;
  }
} // end-size-util-class
