/*
 * Package: UiH (UI Helper)
 * Author: Yuvraj Sonawane
 * Created: [Date]
 * Description: Global configuration and initialization for context-free numeric extensions.
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

/// Exception thrown when attempting to use context-free UiH extensions
/// without proper initialization
///
/// This exception provides helpful error messages guiding users to properly
/// initialize UiH using one of the available methods.
///
/// See also:
/// - [UihInit] for automatic initialization (recommended)
/// - [Uih.builder] for MaterialApp.builder integration
/// - [Uih.init] for manual initialization
class UihNotInitializedException implements Exception {
  /// The error message
  final String message;

  /// Creates a UihNotInitializedException with the given message
  const UihNotInitializedException(this.message);

  @override
  String toString() => 'UihNotInitializedException: $message';
}

/// Global configuration and initialization for UiH package
///
/// This singleton class enables context-free numeric extensions by caching
/// screen dimensions and MediaQuery data after one-time initialization.
///
/// ## Quick Start:
///
/// Initialize once in your app's main widget:
/// ```dart
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     Uih.init(context);  // Initialize once
///
///     return MaterialApp(
///       home: HomePage(),
///     );
///   }
/// }
/// ```
///
/// Then use context-free numeric extensions anywhere:
/// ```dart
/// Container(
///   width: 100.w,      // No context needed!
///   height: 50.h,
///   child: Text('Hello', style: TextStyle(fontSize: 14.sp)),
/// )
/// ```
///
/// ## Initialization Patterns:
///
/// ### Pattern A: Manual initialization (recommended for most apps)
/// ```dart
/// void main() => runApp(MyApp());
///
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     Uih.init(context);
///     return MaterialApp(...);
///   }
/// }
/// ```
///
/// ### Pattern B: Automatic re-initialization on screen changes (for responsive apps)
/// ```dart
/// void main() => runApp(UihWidget(child: MyApp()));
///
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(...);
///   }
/// }
/// ```
///
/// ## Backward Compatibility:
///
/// All existing context-based methods continue to work:
/// ```dart
/// // Old API (still works)
/// Container(width: 100.rw(context), height: 50.rh(context))
///
/// // New API (context-free)
/// Container(width: 100.w, height: 50.h)
/// ```
///
/// ## Important Notes:
///
/// - Call [init] before using context-free extensions (`.w`, `.h`, `.sp`, etc.)
/// - For apps with screen rotation or window resizing, call [init] again or use [UihWidget]
/// - Context-based methods (`.rw(context)`, `.rh(context)`) don't require initialization
///
/// See also:
/// - [UihNumericExtension] for the numeric extension API
/// - [UihWidget] for automatic re-initialization on screen changes
class Uih {
  // Singleton pattern
  Uih._internal();
  static final Uih _instance = Uih._internal();
  factory Uih() => _instance;

  // Cached screen data
  static MediaQueryData? _mediaQueryData;
  static bool _initialized = false;

  /// Base design width (iPhone 11 Pro Max reference: 414px)
  /// Override this with [init] if your design uses different dimensions
  static double _designWidth = 414.0;

  /// Base design height (iPhone 11 Pro Max reference: 896px)
  /// Override this with [init] if your design uses different dimensions
  static double _designHeight = 896.0;

  /// Initialize UiH with BuildContext to enable context-free numeric extensions
  ///
  /// Call this once in your app's main widget build method to cache screen
  /// dimensions for context-free usage.
  ///
  /// Example:
  /// ```dart
  /// class MyApp extends StatelessWidget {
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     Uih.init(context);  // Initialize once
  ///
  ///     return MaterialApp(
  ///       home: Scaffold(
  ///         body: Container(
  ///           width: 100.w,   // Now you can use context-free extensions!
  ///           height: 50.h,
  ///         ),
  ///       ),
  ///     );
  ///   }
  /// }
  /// ```
  ///
  /// ## Optional Parameters:
  ///
  /// [designWidth] - Override the base design width (default: 414.0)
  /// [designHeight] - Override the base design height (default: 896.0)
  ///
  /// Example with custom design dimensions:
  /// ```dart
  /// Uih.init(
  ///   context,
  ///   designWidth: 375.0,   // iPhone X design width
  ///   designHeight: 812.0,  // iPhone X design height
  /// );
  /// ```
  ///
  /// ## Re-initialization:
  ///
  /// Call [init] again when screen dimensions change (rotation, window resize):
  /// ```dart
  /// class ResponsiveScreen extends StatelessWidget {
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     Uih.init(context);  // Re-initialize on every build
  ///     return Container(width: 100.w);
  ///   }
  /// }
  /// ```
  ///
  /// Or use [UihWidget] for automatic re-initialization:
  /// ```dart
  /// UihWidget(
  ///   child: Container(width: 100.w),
  /// )
  /// ```
  static void init(
    BuildContext context, {
    double? designWidth,
    double? designHeight,
  }) {
    _mediaQueryData = MediaQuery.of(context);
    _initialized = true;

    // Update base design dimensions if provided
    if (designWidth != null) {
      assert(designWidth > 0, 'Design width must be positive');
      _designWidth = designWidth;
    }
    if (designHeight != null) {
      assert(designHeight > 0, 'Design height must be positive');
      _designHeight = designHeight;
    }
  }

  /// Get cached MediaQueryData
  ///
  /// Throws an assertion error if [init] hasn't been called yet.
  static MediaQueryData get mediaQueryData {
    assert(
      _initialized,
      'UiH not initialized! Call Uih.init(context) in your app\'s build method.\n'
      '\n'
      'Example:\n'
      '@override\n'
      'Widget build(BuildContext context) {\n'
      '  Uih.init(context);\n'
      '  return MaterialApp(...);\n'
      '}',
    );
    return _mediaQueryData!;
  }

  /// Returns true if UiH has been initialized
  static bool get isInitialized => _initialized;

  /// Get cached screen size
  static Size get screenSize => mediaQueryData.size;

  /// Get cached screen width in pixels
  static double get screenWidth => screenSize.width;

  /// Get cached screen height in pixels
  static double get screenHeight => screenSize.height;

  /// Get cached screen diagonal in pixels
  static double get screenDiagonal {
    return sqrt(pow(screenWidth, 2) + pow(screenHeight, 2));
  }

  /// Get user's accessibility text scale factor
  static double get textScaleFactor => mediaQueryData.textScaler.scale(1.0);

  /// Get screen orientation
  static Orientation get orientation => mediaQueryData.orientation;

  /// Returns true if screen is in landscape mode
  static bool get isLandscape => orientation == Orientation.landscape;

  /// Returns true if screen width is below 600dp (mobile devices)
  static bool get isMobile => screenWidth < 600;

  /// Returns true if screen width is between 600dp and 840dp (tablets)
  static bool get isTablet => screenWidth >= 600 && screenWidth < 840;

  /// Returns true if screen width is 840dp or above (desktop)
  static bool get isDesktop => screenWidth >= 840;

  /// Get design width (base reference width for scaling)
  static double get designWidth => _designWidth;

  /// Get design height (base reference height for scaling)
  static double get designHeight => _designHeight;

  /// Get pixels per inch based on platform
  static double get pixelsPerInch {
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

  /// Creates a builder function for use with MaterialApp.builder or CupertinoApp.builder
  ///
  /// This provides a convenient way to integrate UiH with MaterialApp without
  /// wrapping your entire app. The builder automatically initializes UiH and
  /// handles screen dimension changes.
  ///
  /// ## Usage:
  ///
  /// ```dart
  /// MaterialApp(
  ///   builder: Uih.builder(
  ///     designSize: const Size(414, 896),
  ///   ),
  ///   home: HomePage(),
  /// )
  /// ```
  ///
  /// ## With existing builders:
  ///
  /// You can chain builders together:
  /// ```dart
  /// MaterialApp(
  ///   builder: (context, child) {
  ///     // First apply UiH
  ///     child = Uih.builder()(context, child);
  ///
  ///     // Then apply other builders
  ///     return MyCustomBuilder(child: child);
  ///   },
  ///   home: HomePage(),
  /// )
  /// ```
  ///
  /// See also:
  /// - [UihInit] for wrapping your entire app
  /// - [init] for manual initialization
  static TransitionBuilder builder({
    Size designSize = const Size(414, 896),
  }) {
    return (BuildContext context, Widget? child) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Initialize/update UiH whenever screen dimensions change
          Uih.init(
            context,
            designWidth: designSize.width,
            designHeight: designSize.height,
          );
          return child ?? const SizedBox.shrink();
        },
      );
    };
  }

  /// Reset initialization state (mainly for testing)
  @visibleForTesting
  static void reset() {
    _mediaQueryData = null;
    _initialized = false;
    _designWidth = 414.0;
    _designHeight = 896.0;
  }
}

/// Wrapper widget that automatically initializes and updates UiH
///
/// This is the recommended way to initialize UiH, following the pattern
/// popularized by flutter_screenutil. Wrap your MaterialApp or CupertinoApp
/// with this widget to enable automatic initialization and handle screen
/// rotation, window resizing, and hot reload seamlessly.
///
/// ## Key Features:
///
/// - Automatic initialization - no manual [Uih.init] calls needed
/// - Handles screen rotations automatically
/// - Handles window resizing (desktop/web)
/// - Works seamlessly with hot reload during development
/// - Uses LayoutBuilder to detect dimension changes
///
/// ## Usage:
///
/// ```dart
/// void main() => runApp(const MyApp());
///
/// class MyApp extends StatelessWidget {
///   const MyApp({super.key});
///
///   @override
///   Widget build(BuildContext context) {
///     return UihInit(
///       designSize: const Size(414, 896),  // Optional, has defaults
///       builder: (context) => MaterialApp(
///         title: 'My App',
///         home: HomePage(),
///       ),
///     );
///   }
/// }
///
/// // Then use anywhere without manual init!
/// class HomePage extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: Container(
///         width: 100.w,   // Just works!
///         height: 50.h,    // No manual init needed!
///         child: Text('Hello', style: TextStyle(fontSize: 14.sp)),
///       ),
///     );
///   }
/// }
/// ```
///
/// ## Custom Design Dimensions:
///
/// Specify the design dimensions your UI was created for:
/// ```dart
/// UihInit(
///   designSize: const Size(375, 812),  // iPhone X design
///   builder: (context) => MaterialApp(...),
/// )
/// ```
///
/// ## How It Works:
///
/// Uses [LayoutBuilder] to detect screen dimension changes and automatically
/// re-initializes UiH. This ensures that all responsive values (`.w`, `.h`, `.sp`)
/// are always calculated with the latest screen dimensions.
///
/// ## Performance:
///
/// The initialization is very lightweight (just caching MediaQueryData), so
/// re-initialization on dimension changes has negligible performance impact.
///
/// ## Comparison with Other Approaches:
///
/// | Approach | Automatic Init | Handles Rotation | Recommended |
/// |----------|---------------|------------------|-------------|
/// | UihInit (NEW) | Yes | Yes | ✅ Yes - Best DX |
/// | MaterialApp.builder with Uih.builder() | Yes | Yes | ✅ Yes - Alternative |
/// | UihWidget | Yes | Yes | ⚠️ Legacy - Use UihInit instead |
/// | Manual Uih.init() | No | No | ❌ Not recommended |
///
/// See also:
/// - [Uih.builder] for MaterialApp.builder integration
/// - [Uih.init] for manual initialization (advanced use cases)
/// - [UihWidget] for legacy compatibility
class UihInit extends StatelessWidget {
  /// Builder that returns your app (typically MaterialApp or CupertinoApp)
  final Widget Function(BuildContext context) builder;

  /// Design dimensions for responsive scaling
  ///
  /// This should match the screen size your designs were created for.
  /// Common values:
  /// - `Size(414, 896)` - iPhone 11 Pro Max (default)
  /// - `Size(375, 812)` - iPhone X/XS/11 Pro
  /// - `Size(360, 640)` - Common Android reference
  final Size designSize;

  const UihInit({
    super.key,
    required this.builder,
    this.designSize = const Size(414, 896),
  });

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to detect screen dimension changes
    // This triggers rebuilds when the screen size changes (rotation, resize)
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Initialize/update UiH with current screen dimensions
        Uih.init(
          context,
          designWidth: designSize.width,
          designHeight: designSize.height,
        );

        // Build the app
        return builder(context);
      },
    );
  }
}

/// Widget that automatically initializes/updates UiH on screen size changes
///
/// **DEPRECATED**: Use [UihInit] instead for better developer experience.
///
/// [UihWidget] is maintained for backward compatibility but [UihInit] is now
/// the recommended approach as it follows the pattern popularized by
/// flutter_screenutil and provides a cleaner API.
///
/// ### Migration:
///
/// **Before (UihWidget):**
/// ```dart
/// runApp(
///   UihWidget(
///     designWidth: 414,
///     designHeight: 896,
///     child: MyApp(),
///   ),
/// );
/// ```
///
/// **After (UihInit - Recommended):**
/// ```dart
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return UihInit(
///       designSize: const Size(414, 896),
///       builder: (context) => MaterialApp(...),
///     );
///   }
/// }
/// ```
///
/// ## Original Usage:
///
/// ### Wrap entire app:
/// ```dart
/// void main() {
///   runApp(
///     UihWidget(
///       child: MyApp(),
///     ),
///   );
/// }
///
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       home: Container(
///         width: 100.w,  // No manual init needed!
///         height: 50.h,
///       ),
///     );
///   }
/// }
/// ```
///
/// ### Wrap specific screens:
/// ```dart
/// class ResponsiveScreen extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return UihWidget(
///       child: Scaffold(
///         body: Container(width: 100.w),
///       ),
///     );
///   }
/// }
/// ```
///
/// ## Custom Design Dimensions:
///
/// ```dart
/// UihWidget(
///   designWidth: 375.0,
///   designHeight: 812.0,
///   child: MyApp(),
/// )
/// ```
///
/// ## Performance Note:
///
/// Re-initialization on every build is a cheap operation (just caching
/// MediaQueryData), so wrapping at the app level is perfectly fine.
///
/// See also:
/// - [UihInit] for the recommended approach
/// - [Uih.init] for manual initialization
class UihWidget extends StatelessWidget {
  /// The widget subtree that can use context-free numeric extensions
  final Widget child;

  /// Optional custom design width (default: 414.0)
  final double? designWidth;

  /// Optional custom design height (default: 896.0)
  final double? designHeight;

  const UihWidget({
    super.key,
    required this.child,
    this.designWidth,
    this.designHeight,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize/update UiH with current screen dimensions
    Uih.init(
      context,
      designWidth: designWidth,
      designHeight: designHeight,
    );
    return child;
  }
}
