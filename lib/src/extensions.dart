/*
 * Package: UiH (UI Helper)
 * Author: Yuvraj Sonawane
 * Created: [Date]
 * Description: A small package to help you with your UI development.
 *
 * This file is part of UiH Package.
 *
 * UiH Package is free software: you can redistribute it and/or modify
 * it under the terms of the MIT.
 *
 * UiH Package is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * MIT for more details.
 *
 * You should have received a copy of the MIT
 * along with UiH Package. If not, see https://github.com/adaptolearning/UiH/blob/main/LICENSE.
 *
 */

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

  /// Returns pixel size in Points
  /// [NOTE] : `Points` are `not` `Pixels` and `Pixels` are `not` `Points`.
  Size get sizePoints {
    final Size pxSize = sizePx;
    return Size(pxSize.width / mq.devicePixelRatio,
        pxSize.height / mq.devicePixelRatio);
  }

  /// Returns diagonal screen points
  double get diagonalPoints {
    final Size s = sizePoints;
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  /// Get the proportionate/relative FontSize as per the screen size
  double relativeFontSize(double fontSize) {
    final screenWidth = mq.size.width;
    final screenHeight = mq.size.height;
    final diagonalSize = sqrt(pow(screenWidth, 2) + pow(screenHeight, 2));
    final scaleFactor =
        diagonalSize / 1000; // You can adjust this value to your liking
    return (fontSize * scaleFactor).roundToDouble();
  }

  /// Get the proportionate/relative FontSize as per the screen size
  double relativeFontSizeWithBreakPoint(double fontSize) {
    final screenWidth = mq.size.width;
    final screenHeight = mq.size.height;
    final diagonalSize = sqrt(pow(screenWidth, 2) + pow(screenHeight, 2));
    double breakpoint;
    double scaleFactor;

    if (screenWidth < 360) {
      breakpoint = 600;
      scaleFactor = 0.8;
    } else if (screenWidth < 480) {
      breakpoint = 800;
      scaleFactor = 1.0;
    } else {
      breakpoint = 1000;
      scaleFactor = 1.2;
    }

    final breakpointDiagonalSize =
        sqrt(pow(breakpoint, 2) + pow(screenHeight, 2));
    final breakpointScaleFactor = breakpointDiagonalSize / 1000;
    final relativeScaleFactor =
        diagonalSize < breakpoint ? scaleFactor : breakpointScaleFactor;
    return (fontSize * relativeScaleFactor).roundToDouble();
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
  Widget horizontalSpacer({int multiplyBy = 1}) {
    final widthPx = 10.0; // Replace with your desired width in pixels
    final width = relativeScreenWidth(widthPx) * 0.01 * multiplyBy.abs();
    return SizedBox(width: width);
  }

  /// Get the proportionate SizedBox with Height as per the screen size. [verticalSpacer]
  /// [multiplyBy] is an optional value which is `1` by default and when this param
  /// is passed, the [verticalSpacer] value will be `multiplied` by it.
  /// Example : `{int multiplyBy: 2}` will give a value of `20` if `default height`
  /// is `10` as per the `formula` for consistency.
  /// [NOTE] : `Negative` values will be automatically converted to `Positive` values for [multiplyBy] option.
  Widget verticalSpacer({int multiplyBy = 1}) {
    final heightPx = 10.0; // Replace with your desired height in pixels
    final height = relativeScreenHeight(heightPx) * 0.01 * multiplyBy.abs();
    return SizedBox(height: height);
  }

  /// width below [650] can be considered as mobile platform
  bool get isMobile => mq.size.width < 650;

  /// width in between [650] and [1100] can be considered as tablet platform
  bool get isTablet => mq.size.width < 1100 && mq.size.width >= 650;

  /// width above [1100] can be considered as desktop platform
  bool get isDesktop => mq.size.width >= 1100;

  // Theme Section
  /// Return Theme.of(context) instance
  ThemeData get theme => Theme.of(this);

  /// Return `Theme` based [backgroundColor]
  Color get backgroundColor => theme.colorScheme.background;

  /// Return `Theme` based [typography]
  Typography get typography => theme.typography;

  /// Return `Theme` based [brightness]
  Brightness get brightness => theme.brightness;

  // Scaffold Message Section
  showSnackBar(SnackBar child) =>
      ScaffoldMessenger.of(this).showSnackBar(child);
}
