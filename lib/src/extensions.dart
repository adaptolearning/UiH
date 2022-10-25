import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';

extension uih on BuildContext {
  static double constWidth = 414.0; // 414 is the layout width that designer use
  static double constHeight =
      896.0; // 896 is the layout height that designer use

  /// Return MediaQuery.of(context) instance
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns same as MediaQuery.of(context).size
  Size get sizePx => mq.size;

  /// If android or iOS return value is 150 or else 96
  double get pixelsPerInch => Platform.isAndroid || Platform.isIOS ? 150 : 96;

  /// Get the proportionate/relative height as per the screen size [getProportionateScreenHeight]
  double relativeScreenHeight(double inputHeight) {
    double screenHeight = mq.size.height;
    return (inputHeight / constHeight) * screenHeight;
  }

  /// Get the proportionate/relative width as per the screen size
  double relativeScreenWidth(double inputWidth) {
    double screenWidth = mq.size.width;
    return (inputWidth / constWidth) * screenWidth;
  }

  /// Returns pixel size in Inches
  Size get sizeInches {
    final Size pxSize = sizePx;
    return Size(pxSize.width / pixelsPerInch, pxSize.height / pixelsPerInch);
  }

  /// Returns diagonal screen pixels
  double get diagonalPx {
    final Size s = sizePx;
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  /// Returns same as MediaQuery.of(context).size.width
  double get widthPx => sizePx.width;

  /// Returns same as MediaQuery.of(context).height
  double get heightPx => sizePx.height;

  /// Returns screen width in Inches
  double get widthInches => sizeInches.width;

  /// Returns screen height in Inches
  double get heightInches => sizeInches.height;

  /// Returns screen diagonal in Inches
  double get diagonalInches => diagonalPx / pixelsPerInch;

  /// Returns fraction (0-1) of screen width in pixels
  double widthPct(double fraction) => fraction * widthPx;

  /// Returns fraction (0-1) of screen height in pixels
  double heightPct(double fraction) => fraction * heightPx;

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Get the proportionate SizedBox with Height as per the screen size. [horizontalSpacer]
  /// [multiplyBy] is an optional value which is `1` by default and when this param
  /// is passed, the [horizontalSpacer] value will be `multiplied` by it.
  /// Example : `{int multiplyBy: 2}` will give a value of `20` if `default width`
  /// is `10` as per the `formula` for consistency.
  /// [NOTE] : `Negative` values will be automatically converted to `Positive` values for [multiplyBy] option.
  Widget horizontalSpacer({int multiplyBy: 1}) =>
      SizedBox(width: relativeScreenWidth(widthPx) * 0.01 * multiplyBy.abs());

  /// Get the proportionate SizedBox with Height as per the screen size. [verticalSpacer]
  /// [multiplyBy] is an optional value which is `1` by default and when this param
  /// is passed, the [verticalSpacer] value will be `multiplied` by it.
  /// Example : `{int multiplyBy: 2}` will give a value of `20` if `default height`
  /// is `10` as per the `formula` for consistency.
  /// [NOTE] : `Negative` values will be automatically converted to `Positive` values for [multiplyBy] option.
  Widget verticalSpacer({int multiplyBy: 1}) => SizedBox(
      height: relativeScreenHeight(heightPx) * 0.01 * multiplyBy.abs());

  /// width below [650] can be considered as mobile platform
  bool get isMobile => mq.size.width < 650;

  /// width in between [650] and [1100] can be considered as tablet platform
  bool get isTablet => mq.size.width < 1100 && mq.size.width >= 650;

  /// width above [1100] can be considered as desktop platform
  bool get isDesktop => mq.size.width >= 1100;
}
