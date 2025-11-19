/*
 * Package: UiH (UI Helper)
 * Author: Yuvraj Sonawane
 * Created: [Date]
 * Description: Numeric extensions for responsive UI development.
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

import 'package:flutter/widgets.dart';
import 'context_ext.dart';
import 'uih_config.dart' show Uih, UihInit, UihNotInitializedException;

/// Helper function to throw initialization exception with Never return type
Never _throwNotInitialized(
    String contextFreeMethod, String contextBasedMethod) {
  throw UihNotInitializedException(
    'UiH has not been initialized!\n\n'
    'Please wrap your app with UihInit (recommended):\n\n'
    'class MyApp extends StatelessWidget {\n'
    '  @override\n'
    '  Widget build(BuildContext context) {\n'
    '    return UihInit(\n'
    '      builder: (context) => MaterialApp(...),\n'
    '    );\n'
    '  }\n'
    '}\n\n'
    'Or use MaterialApp.builder:\n\n'
    'MaterialApp(\n'
    '  builder: Uih.builder(),\n'
    '  home: HomePage(),\n'
    ')\n\n'
    'Or use the context-based API: $contextBasedMethod',
  );
}

/// Helper function to throw initialization exception (short version)
Never _throwNotInitializedShort(String contextBasedMethod) {
  throw UihNotInitializedException(
    'UiH has not been initialized! See documentation for .w getter for initialization options.\n\n'
    'Quick fix: Use the context-based API: $contextBasedMethod',
  );
}

/// Numeric extensions for responsive UI values
///
/// Provides convenient shorthand methods for responsive sizing that work with
/// both [int] and [double] values. Supports both context-based and context-free APIs.
///
/// ## Context-Free API (NEW - Recommended):
///
/// Initialize once, use anywhere without context:
/// ```dart
/// // 1. Initialize in your app
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     Uih.init(context);  // Initialize once
///     return MaterialApp(home: HomePage());
///   }
/// }
///
/// // 2. Use anywhere without context
/// Container(
///   width: 100.w,      // No context needed!
///   height: 50.h,
///   child: Text('Hello', style: TextStyle(fontSize: 14.sp)),
/// )
/// ```
///
/// ## Context-Based API (Original - Still Supported):
///
/// Pass context to each method call:
/// ```dart
/// // Dimensions
/// Container(
///   width: 100.rw(context),   // Relative width (scaled to design)
///   height: 50.rh(context),   // Relative height (scaled to design)
/// )
///
/// // Font sizes
/// Text(
///   'Hello',
///   style: TextStyle(
///     fontSize: 16.sf(context),  // Scaled font (diagonal-based)
///     fontSize: 16.sp(context),  // Scaled pixel (common alias)
///     fontSize: 16.af(context),  // Adaptive font (breakpoint-based)
///   ),
/// )
///
/// // Screen fractions (0.0 to 1.0)
/// Container(
///   width: 0.5.wf(context),   // 50% of screen width
///   height: 0.3.hf(context),  // 30% of screen height
/// )
/// ```
///
/// ## Method Categories:
///
/// ### Context-Free Getters (NEW):
/// - [w] / [rw] / [relativeWidth] - Width scaled to screen size
/// - [h] / [rh] / [relativeHeight] - Height scaled to screen size
/// - [sp] / [sf] / [scaledFont] - Diagonal-based font scaling
/// - [af] / [adaptiveFont] - Breakpoint-based font scaling
/// - [wf] / [widthFraction] - Percentage of screen width
/// - [hf] / [heightFraction] - Percentage of screen height
///
/// ### Context-Based Methods (Original):
/// All methods with (BuildContext context) parameter continue to work.
///
/// ## Design Philosophy:
///
/// This API provides both context-free and context-based approaches:
/// - **Context-free**: Initialize once with [Uih.init], use everywhere (like flutter_screenutil)
/// - **Context-based**: No initialization needed, pass context each time (original API)
///
/// Choose the approach that fits your project needs. Both can coexist in the same codebase.
///
/// See also:
/// - [Uih] for initialization and configuration
/// - [UihWidget] for automatic re-initialization on screen changes
/// - [UihBuildContextExtension] for the underlying implementation
extension UihNumericExtension on num {
  // ============================================================================
  // RELATIVE DIMENSIONS (Design-Scaled)
  // ============================================================================

  /// Returns relative width scaled to screen size based on design dimensions (context-based)
  ///
  /// Scales the numeric value from the reference design width (414px) to the
  /// current screen width. This ensures consistent relative sizing across
  /// different screen sizes.
  ///
  /// **Delegation**: `context.relativeWidth(this.toDouble())`
  ///
  /// **Note**: This is the context-based API. For context-free usage after [Uih.init],
  /// use the getter: `100.w` instead of `100.rw(context)`
  ///
  /// Example:
  /// ```dart
  /// Container(
  ///   width: 100.rw(context),  // 100px from 414px design → scaled to screen
  ///   padding: EdgeInsets.all(16.rw(context)),
  /// )
  /// ```
  ///
  /// See also:
  /// - [w] for the context-free getter version
  /// - [UihBuildContextExtension.relativeWidth] for implementation details
  double rw(BuildContext context) => context.relativeWidth(toDouble());

  /// Descriptive alias for [rw] - use when code clarity is prioritized (context-based)
  ///
  /// Example:
  /// ```dart
  /// Container(width: 100.relativeWidth(context))  // Self-documenting
  /// ```
  ///
  /// Note: For context-free API, use the getter: `100.w`
  double relativeWidth(BuildContext context) => rw(context);

  // ============================================================================
  // CONTEXT-FREE GETTERS (NEW)
  // ============================================================================

  /// Context-free relative width - requires [Uih.init] to be called first
  ///
  /// Returns width scaled to screen size without requiring a BuildContext.
  /// This is the most ergonomic API, following the pattern popularized by
  /// flutter_screenutil.
  ///
  /// **Requires Initialization:**
  /// ```dart
  /// class MyApp extends StatelessWidget {
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     Uih.init(context);  // Initialize once
  ///     return MaterialApp(home: HomePage());
  ///   }
  /// }
  /// ```
  ///
  /// **Usage:**
  /// ```dart
  /// Container(
  ///   width: 100.w,   // No context needed!
  ///   padding: EdgeInsets.all(16.w),
  /// )
  /// ```
  ///
  /// **Implementation:**
  /// Scales the numeric value from the reference design width (414px) to the
  /// current screen width using cached MediaQueryData.
  ///
  /// See also:
  /// - [rw] for the context-based version (method, not getter)
  /// - [Uih.init] for initialization
  /// - [UihInit] for automatic initialization (recommended)
  double get w {
    if (!Uih.isInitialized) {
      return _throwNotInitialized('.w', '${toDouble()}.rw(context)');
    }
    final screenWidth = Uih.screenWidth;
    final baseWidth = Uih.designWidth;
    return (toDouble() / baseWidth) * screenWidth;
  }

  /// Context-free relative height - requires [Uih.init] to be called first
  ///
  /// Returns height scaled to screen size without requiring a BuildContext.
  ///
  /// **Usage:**
  /// ```dart
  /// Container(
  ///   height: 50.h,
  ///   margin: EdgeInsets.symmetric(vertical: 12.h),
  /// )
  /// ```
  ///
  /// See [w] for initialization requirements and examples.
  ///
  /// See also:
  /// - [rh] for the context-based version (method, not getter)
  double get h {
    if (!Uih.isInitialized) {
      return _throwNotInitializedShort('${toDouble()}.rh(context)');
    }
    final screenHeight = Uih.screenHeight;
    final baseHeight = Uih.designHeight;
    return (toDouble() / baseHeight) * screenHeight;
  }

  /// Context-free scaled font size - requires [Uih.init] to be called first
  ///
  /// Returns font size scaled based on screen diagonal without requiring a BuildContext.
  /// The most commonly used name (sp = scaled pixel).
  ///
  /// **Usage:**
  /// ```dart
  /// Text(
  ///   'Hello World',
  ///   style: TextStyle(fontSize: 14.sp),
  /// )
  /// ```
  ///
  /// **Accessibility:**
  /// Automatically respects user's accessibility text scale factor.
  ///
  /// See [w] for initialization requirements and examples.
  ///
  /// See also:
  /// - [sf] for the context-based version (method, not getter)
  double get sp {
    if (!Uih.isInitialized) {
      return _throwNotInitializedShort('${toDouble()}.sf(context)');
    }

    final screenDiagonal = Uih.screenDiagonal;
    const double baselineDiagonal = 984.0; // sqrt(414^2 + 896^2)

    final scaleFactor = screenDiagonal / baselineDiagonal;
    double scaledSize = toDouble() * scaleFactor;

    // Apply accessibility scaling
    scaledSize = Uih.mediaQueryData.textScaler.scale(scaledSize);

    return scaledSize;
  }

  /// Context-free adaptive font size - requires [Uih.init] to be called first
  ///
  /// Returns font size with breakpoint-based scaling without requiring a BuildContext.
  /// Applies different scaling factors based on device width:
  /// - Small phones (<360dp): 0.8x
  /// - Medium phones (360-479dp): 1.0x
  /// - Large phones/tablets (480-767dp): 1.1x
  /// - Desktop (≥768dp): 1.2x
  ///
  /// **Usage:**
  /// ```dart
  /// Text(
  ///   'Heading',
  ///   style: TextStyle(fontSize: 24.af),  // Larger on tablets
  /// )
  /// ```
  ///
  /// See [w] for initialization requirements and examples.
  ///
  /// See also:
  /// - [af] for the context-based version (method, not getter)
  /// - [sp] for smooth diagonal-based scaling
  double get af {
    if (!Uih.isInitialized) {
      return _throwNotInitializedShort('${toDouble()}.afc(context)');
    }

    final width = Uih.screenWidth;
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

    double scaledSize = toDouble() * scaleFactor;

    // Apply accessibility scaling
    scaledSize = Uih.mediaQueryData.textScaler.scale(scaledSize);

    return scaledSize;
  }

  /// Context-free width fraction - requires [Uih.init] to be called first
  ///
  /// Returns a fraction of screen width (0.0 to 1.0) without requiring a BuildContext.
  ///
  /// **Usage:**
  /// ```dart
  /// Container(
  ///   width: 0.5.wf,   // 50% of screen width
  ///   width: 0.75.wf,  // 75% of screen width
  /// )
  /// ```
  ///
  /// **Important:** Values outside 0.0-1.0 will trigger an assertion error.
  ///
  /// See [w] for initialization requirements and examples.
  ///
  /// See also:
  /// - [wf] for the context-based version (method, not getter)
  /// - [w] for design-scaled width (not percentage-based)
  double get wf {
    if (!Uih.isInitialized) {
      return _throwNotInitializedShort('${toDouble()}.wfc(context)');
    }
    assert(
      toDouble() >= 0.0 && toDouble() <= 1.0,
      'Width fraction must be between 0.0 and 1.0, got $this',
    );
    return toDouble() * Uih.screenWidth;
  }

  /// Context-free height fraction - requires [Uih.init] to be called first
  ///
  /// Returns a fraction of screen height (0.0 to 1.0) without requiring a BuildContext.
  ///
  /// **Usage:**
  /// ```dart
  /// Container(
  ///   height: 0.3.hf,   // 30% of screen height
  ///   height: 0.8.hf,   // 80% of screen height
  /// )
  /// ```
  ///
  /// **Important:** Values outside 0.0-1.0 will trigger an assertion error.
  ///
  /// See [w] for initialization requirements and examples.
  ///
  /// See also:
  /// - [hf] for the context-based version (method, not getter)
  /// - [h] for design-scaled height (not percentage-based)
  double get hf {
    if (!Uih.isInitialized) {
      return _throwNotInitializedShort('${toDouble()}.hfc(context)');
    }
    assert(
      toDouble() >= 0.0 && toDouble() <= 1.0,
      'Height fraction must be between 0.0 and 1.0, got $this',
    );
    return toDouble() * Uih.screenHeight;
  }

  // ============================================================================
  // CONTEXT-BASED METHODS (Original API - Backward Compatible)
  // ============================================================================

  /// Returns relative height scaled to screen size based on design dimensions (context-based)
  ///
  /// Scales the numeric value from the reference design height (896px) to the
  /// current screen height. This ensures consistent relative sizing across
  /// different screen sizes.
  ///
  /// **Delegation**: `context.relativeHeight(this.toDouble())`
  ///
  /// **Note**: This is the context-based API. For context-free usage after [Uih.init],
  /// use the getter: `50.h` instead of `50.rh(context)`
  ///
  /// Example:
  /// ```dart
  /// Container(
  ///   height: 50.rh(context),  // 50px from 896px design → scaled to screen
  ///   margin: EdgeInsets.symmetric(vertical: 12.rh(context)),
  /// )
  /// ```
  ///
  /// See also:
  /// - [h] for the context-free getter version
  /// - [UihBuildContextExtension.relativeHeight] for implementation details
  double rh(BuildContext context) => context.relativeHeight(toDouble());

  /// Descriptive alias for [rh] - use when code clarity is prioritized (context-based)
  ///
  /// Example:
  /// ```dart
  /// Container(height: 50.relativeHeight(context))  // Self-documenting
  /// ```
  ///
  /// Note: For context-free API, use the getter: `50.h`
  double relativeHeight(BuildContext context) => rh(context);

  // ============================================================================
  // FONT SCALING
  // ============================================================================

  /// Returns scaled font size based on screen diagonal (context-based)
  ///
  /// Provides smooth, continuous font scaling based on screen diagonal relative
  /// to the baseline device (iPhone 11 Pro Max). By default, respects user
  /// accessibility settings (textScaleFactor).
  ///
  /// **Delegation**: `context.scaledFontSize(this.toDouble())`
  ///
  /// **Note**: This is the context-based API. For context-free usage after [Uih.init],
  /// use the getter: `16.sp` instead of `16.sf(context)`
  ///
  /// Use this when you want proportional font scaling across all device sizes.
  ///
  /// Example:
  /// ```dart
  /// Text(
  ///   'Title',
  ///   style: TextStyle(fontSize: 16.sf(context)),
  /// )
  /// ```
  ///
  /// See also:
  /// - [sp] for the context-free getter version
  /// - [UihBuildContextExtension.scaledFontSize] for implementation details
  double sf(BuildContext context) => context.scaledFontSize(toDouble());

  /// Descriptive alias for [sf] - use when code clarity is prioritized (context-based)
  ///
  /// Example:
  /// ```dart
  /// Text('Body', style: TextStyle(fontSize: 14.scaledFont(context)))
  /// ```
  ///
  /// Note: For context-free API, use the getter: `14.sp`
  double scaledFont(BuildContext context) => sf(context);

  /// Returns adaptive font size with breakpoint-based scaling (context-based)
  ///
  /// Applies different scaling factors based on device width breakpoints:
  /// - Small phones (<360dp): 0.8x
  /// - Medium phones (360-479dp): 1.0x
  /// - Large phones/tablets (480-767dp): 1.1x
  /// - Desktop (≥768dp): 1.2x
  ///
  /// **Delegation**: `context.adaptiveFontSize(this.toDouble())`
  ///
  /// **Note**: This is the context-based API. For context-free usage after [Uih.init],
  /// use the getter: `24.af` instead of `24.afc(context)`
  ///
  /// Use this when you need more aggressive font scaling across device
  /// categories compared to [sf].
  ///
  /// Example:
  /// ```dart
  /// Text(
  ///   'Heading',
  ///   style: TextStyle(fontSize: 24.afc(context)),  // Larger on tablets
  /// )
  /// ```
  ///
  /// See also:
  /// - [af] for the context-free getter version
  /// - [sf] for smooth diagonal-based scaling
  /// - [UihBuildContextExtension.adaptiveFontSize] for implementation details
  double afc(BuildContext context) => context.adaptiveFontSize(toDouble());

  /// Descriptive alias for [afc] - use when code clarity is prioritized (context-based)
  ///
  /// Example:
  /// ```dart
  /// Text('Heading', style: TextStyle(fontSize: 24.adaptiveFont(context)))
  /// ```
  ///
  /// Note: For context-free API, use the getter: `24.af`
  double adaptiveFont(BuildContext context) => afc(context);

  // ============================================================================
  // SCREEN FRACTIONS (Percentage-based)
  // ============================================================================

  /// Returns a fraction of screen width (0.0 to 1.0) (context-based)
  ///
  /// Multiplies the numeric value by screen width. Useful for percentage-based
  /// layouts. The value should be between 0.0 and 1.0.
  ///
  /// **Delegation**: `context.widthFraction(this.toDouble())`
  ///
  /// **Note**: This is the context-based API. For context-free usage after [Uih.init],
  /// use the getter: `0.5.wf` instead of `0.5.wfc(context)`
  ///
  /// Example:
  /// ```dart
  /// Container(
  ///   width: 0.5.wfc(context),   // 50% of screen width
  ///   width: 0.75.wfc(context),  // 75% of screen width
  /// )
  /// ```
  ///
  /// **Important**: Values outside 0.0-1.0 will trigger an assertion error.
  ///
  /// See also:
  /// - [wf] for the context-free getter version
  /// - [rw] for design-scaled width (not percentage-based)
  /// - [UihBuildContextExtension.widthFraction] for implementation details
  double wfc(BuildContext context) => context.widthFraction(toDouble());

  /// Descriptive alias for [wfc] - use when code clarity is prioritized (context-based)
  ///
  /// Example:
  /// ```dart
  /// Container(width: 0.5.widthFraction(context))  // Self-documenting
  /// ```
  ///
  /// Note: For context-free API, use the getter: `0.5.wf`
  double widthFraction(BuildContext context) => wfc(context);

  /// Returns a fraction of screen height (0.0 to 1.0) (context-based)
  ///
  /// Multiplies the numeric value by screen height. Useful for percentage-based
  /// layouts. The value should be between 0.0 and 1.0.
  ///
  /// **Delegation**: `context.heightFraction(this.toDouble())`
  ///
  /// **Note**: This is the context-based API. For context-free usage after [Uih.init],
  /// use the getter: `0.3.hf` instead of `0.3.hfc(context)`
  ///
  /// Example:
  /// ```dart
  /// Container(
  ///   height: 0.3.hfc(context),   // 30% of screen height
  ///   height: 0.8.hfc(context),   // 80% of screen height
  /// )
  /// ```
  ///
  /// **Important**: Values outside 0.0-1.0 will trigger an assertion error.
  ///
  /// See also:
  /// - [hf] for the context-free getter version
  /// - [rh] for design-scaled height (not percentage-based)
  /// - [UihBuildContextExtension.heightFraction] for implementation details
  double hfc(BuildContext context) => context.heightFraction(toDouble());

  /// Descriptive alias for [hfc] - use when code clarity is prioritized (context-based)
  ///
  /// Example:
  /// ```dart
  /// Container(height: 0.3.heightFraction(context))  // Self-documenting
  /// ```
  ///
  /// Note: For context-free API, use the getter: `0.3.hf`
  double heightFraction(BuildContext context) => hfc(context);
}
