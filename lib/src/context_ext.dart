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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Responsive UI extensions for BuildContext
///
/// Provides helpers for:
/// - Screen dimension queries (width, height, size)
/// - Responsive sizing (relative width/height based on design dimensions)
/// - Platform detection (mobile, tablet, desktop)
/// - Theme access shortcuts
/// - Navigation helpers
extension UihBuildContextExtension on BuildContext {
  /// Base design width (iPhone 11 Pro Max reference: 414px)
  /// This represents the canonical design width from your UI/UX team
  static const double constWidth = 414.0;

  /// Base design height (iPhone 11 Pro Max reference: 896px)
  /// This represents the canonical design height from your UI/UX team
  static const double constHeight = 896.0;

  /// Return MediaQuery.of(context) instance
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns same as MediaQuery.of(context).size
  Size get sizeInPixels => mediaQuery.size;

  /// Returns pixels per inch based on platform
  /// Mobile platforms (Android/iOS): 150 PPI
  /// Desktop platforms (macOS/Windows/Linux): 96 PPI
  double get pixelsPerInch {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return 150.0;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return 96.0;
    }
  }

  /// Get the proportionate/relative height as per the screen size
  ///
  /// Scales a design height value to the current screen height based on the
  /// reference design dimensions (896px).
  ///
  /// Example: If design specifies 100px height on a 896px tall design,
  /// this will scale proportionally on any screen height.
  ///
  /// [inputHeight] - Height value from your design system
  double relativeHeight(double inputHeight) {
    assert(inputHeight >= 0, 'Height cannot be negative');
    final screenHeight = mediaQuery.size.height;
    return (inputHeight / constHeight) * screenHeight;
  }

  /// Get the proportionate/relative width as per the screen size
  ///
  /// Scales a design width value to the current screen width based on the
  /// reference design dimensions (414px).
  ///
  /// Example: If design specifies 100px width on a 414px wide design,
  /// this will scale proportionally on any screen width.
  ///
  /// [inputWidth] - Width value from your design system
  double relativeWidth(double inputWidth) {
    assert(inputWidth >= 0, 'Width cannot be negative');
    final screenWidth = mediaQuery.size.width;
    return (inputWidth / constWidth) * screenWidth;
  }

  /// Returns pixel size in Points
  /// [NOTE] : `Points` are `not` `Pixels` and `Pixels` are `not` `Points`.
  Size get sizeInPoints {
    final Size pxSize = sizeInPixels;
    return Size(pxSize.width / mediaQuery.devicePixelRatio,
        pxSize.height / mediaQuery.devicePixelRatio);
  }

  /// Returns diagonal screen points
  double get diagonalInPoints {
    final Size s = sizeInPoints;
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  /// Scales font size based on screen diagonal, respecting accessibility settings
  ///
  /// The scale factor is calculated using screen diagonal relative to a baseline
  /// device diagonal (~984px for iPhone 11 Pro Max reference design).
  ///
  /// By default, this method respects the user's accessibility text scale factor.
  /// Set [respectAccessibility] to false if you need fixed sizing (not recommended).
  ///
  /// Example:
  /// ```dart
  /// Text(
  ///   'Hello World',
  ///   style: TextStyle(
  ///     fontSize: context.scaledFontSize(16),
  ///   ),
  /// )
  /// ```
  ///
  /// [fontSize] - Base font size from your design system
  /// [respectAccessibility] - Whether to apply MediaQuery.textScaleFactor (default: true)
  ///
  /// Returns the scaled font size as a double (not rounded for smooth scaling)
  double scaledFontSize(
    double fontSize, {
    bool respectAccessibility = true,
  }) {
    assert(fontSize > 0, 'Font size must be positive');

    final size = mediaQuery.size;
    final screenDiagonal = sqrt(pow(size.width, 2) + pow(size.height, 2));

    // Baseline diagonal from reference design (iPhone 11 Pro Max)
    // sqrt(414^2 + 896^2) ≈ 984
    const double baselineDiagonal = 984.0;

    final scaleFactor = screenDiagonal / baselineDiagonal;
    double scaledSize = fontSize * scaleFactor;

    if (respectAccessibility) {
      scaledSize = mediaQuery.textScaler.scale(scaledSize);
    }

    // Return precise value - don't round for smoother scaling
    return scaledSize;
  }

  /// Scales font size with breakpoint-based constraints for better typography
  /// across device sizes.
  ///
  /// This method applies different scaling strategies based on device width:
  /// - Small phones (<360dp): Reduces font size by 20% for readability
  /// - Medium phones (360-479dp): Normal scaling
  /// - Large phones/small tablets (480-767dp): Increases by 10%
  /// - Tablets/desktop (≥768dp): Increases font size by 20%
  ///
  /// Use this when you need more aggressive font scaling across device sizes
  /// compared to [scaledFontSize].
  ///
  /// Example:
  /// ```dart
  /// Text(
  ///   'Title',
  ///   style: TextStyle(
  ///     fontSize: context.adaptiveFontSize(24),
  ///   ),
  /// )
  /// ```
  ///
  /// [fontSize] - Base font size from your design system
  /// [respectAccessibility] - Whether to apply MediaQuery.textScaleFactor (default: true)
  ///
  /// See also:
  /// - [scaledFontSize] for smoother, continuous scaling
  double adaptiveFontSize(
    double fontSize, {
    bool respectAccessibility = true,
  }) {
    assert(fontSize > 0, 'Font size must be positive');

    final width = mediaQuery.size.width;
    double scaleFactor;

    if (width < 360) {
      scaleFactor = 0.8; // Small phones
    } else if (width < 480) {
      scaleFactor = 1.0; // Normal phones
    } else if (width < 768) {
      scaleFactor = 1.1; // Large phones / small tablets
    } else {
      scaleFactor = 1.2; // Tablets / desktop
    }

    double scaledSize = fontSize * scaleFactor;

    if (respectAccessibility) {
      scaledSize = mediaQuery.textScaler.scale(scaledSize);
    }

    return scaledSize;
  }

  /// Returns pixel size in Inches
  Size get sizeInInches {
    final Size pxSize = sizeInPixels;
    return Size(pxSize.width / pixelsPerInch, pxSize.height / pixelsPerInch);
  }

  /// Returns diagonal screen pixels
  double get diagonalInPixels {
    final Size s = sizeInPixels;
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  /// Returns same as MediaQuery.of(context).size.width
  double get widthInPixels => sizeInPixels.width;

  /// Returns same as MediaQuery.of(context).height
  double get heightInPixels => sizeInPixels.height;

  /// Returns screen width in Inches
  double get widthInInches => sizeInInches.width;

  /// Returns screen height in Inches
  double get heightInInches => sizeInInches.height;

  /// Returns screen diagonal in Inches
  double get diagonalInInches => diagonalInPixels / pixelsPerInch;

  /// Returns a fraction of screen width in pixels
  ///
  /// [fraction] - Fraction as decimal (0.0 to 1.0)
  ///
  /// Example: `widthFraction(0.5)` returns half the screen width
  double widthFraction(double fraction) {
    assert(
      fraction >= 0.0 && fraction <= 1.0,
      'Fraction must be between 0.0 and 1.0, got $fraction',
    );
    return fraction * widthInPixels;
  }

  /// Returns a fraction of screen height in pixels
  ///
  /// [fraction] - Fraction as decimal (0.0 to 1.0)
  ///
  /// Example: `heightFraction(0.5)` returns half the screen height
  double heightFraction(double fraction) {
    assert(
      fraction >= 0.0 && fraction <= 1.0,
      'Fraction must be between 0.0 and 1.0, got $fraction',
    );
    return fraction * heightInPixels;
  }

  /// Returns if Orientation is landscape
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  /// Creates horizontal spacing proportional to screen width
  ///
  /// [size] - Base size in design pixels (default: 10.0)
  /// [multiplier] - Multiplier for the base size (default: 1.0)
  ///
  /// Example:
  /// ```dart
  /// Row(
  ///   children: [
  ///     Text('Left'),
  ///     context.horizontalSpacer(size: 16, multiplier: 2), // 32dp spacing
  ///     Text('Right'),
  ///   ],
  /// )
  /// ```
  SizedBox horizontalSpacer({double size = 10.0, double multiplier = 1.0}) {
    assert(size >= 0, 'Spacer size must be non-negative');
    assert(multiplier >= 0, 'Spacer multiplier must be non-negative');
    final width = relativeWidth(size * multiplier);
    return SizedBox(width: width);
  }

  /// Creates vertical spacing proportional to screen height
  ///
  /// [size] - Base size in design pixels (default: 10.0)
  /// [multiplier] - Multiplier for the base size (default: 1.0)
  ///
  /// Example:
  /// ```dart
  /// Column(
  ///   children: [
  ///     Text('Top'),
  ///     context.verticalSpacer(size: 16, multiplier: 2), // 32dp spacing
  ///     Text('Bottom'),
  ///   ],
  /// )
  /// ```
  SizedBox verticalSpacer({double size = 10.0, double multiplier = 1.0}) {
    assert(size >= 0, 'Spacer size must be non-negative');
    assert(multiplier >= 0, 'Spacer multiplier must be non-negative');
    final height = relativeHeight(size * multiplier);
    return SizedBox(height: height);
  }

  /// Returns true if screen width is below 600dp (mobile devices)
  ///
  /// Based on Material Design 3 breakpoints
  /// See: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
  bool get isMobile => mediaQuery.size.width < 600;

  /// Returns true if screen width is between 600dp and 840dp (tablets)
  ///
  /// Based on Material Design 3 breakpoints
  bool get isTablet => mediaQuery.size.width >= 600 && mediaQuery.size.width < 840;

  /// Returns true if screen width is 840dp or above (desktop)
  ///
  /// Based on Material Design 3 breakpoints
  bool get isDesktop => mediaQuery.size.width >= 840;

  // Theme Section
  /// Return Theme.of(context) instance
  ThemeData get theme => Theme.of(this);

  /// Return `TextTheme` instance from `Theme.of(context)`
  TextTheme get textTheme => theme.textTheme;

  /// Return `ColorScheme` instance from `Theme.of(context)`
  ColorScheme get colorScheme => theme.colorScheme;

  /// Return `Theme` based [backgroundColor]
  Color get backgroundColor => theme.colorScheme.surface;

  /// Return `Theme` based [typography]
  Typography get typography => theme.typography;

  /// Return `Theme` based [brightness]
  Brightness get brightness => theme.brightness;

  /// Shows a SnackBar using the nearest ScaffoldMessenger
  ///
  /// Returns a controller that can be used to close or wait for the SnackBar
  ///
  /// Example:
  /// ```dart
  /// context.showSnackBar(
  ///   SnackBar(content: Text('Hello World')),
  /// );
  /// ```
  ///
  /// [snackBar] - The SnackBar widget to display
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    SnackBar snackBar,
  ) {
    return ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  ///Return Navigator.of(context) instance
  NavigatorState get navigator => Navigator.of(this);

  /// Return FocusScope.of(context) instance
  FocusScopeNode get focusScope => FocusScope.of(this);

  /// Return Scaffold.of(context) instance
  ScaffoldState get scaffold => Scaffold.of(this);

  /// Return DefaultTextStyle.of(context) instance
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);
}
