<p align="center">
    <picture>
    <source media="(prefers-color-scheme: light)" srcset="https://github.com/princeteck/UiH/assets/13074740/8789a114-548b-45c9-b1c0-f8705735c0d8">
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/princeteck/UiH/assets/13074740/95da06a5-aa29-46f5-b831-ff1f86936800">
    <img alt="Shows a black logo in light color mode and a white one in dark color mode." src="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
    </picture>
</p>

<h1 align="center">UiH - UI Helper for Flutter</h1>

<p align="center">
  <strong>A complete responsive UI toolkit for Flutter apps across all platforms</strong>
</p>

<p align="center">
  Build beautiful, adaptive interfaces with clean syntax and powerful features.<br>
  Perfect pixel scaling, adaptive layouts, and rich Flutter integration—all in one package.
</p>

<p align="center">
  <a href="https://pub.dev/packages/uih"><img src="https://img.shields.io/pub/v/uih?style=for-the-badge" alt="pub package"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-orange.svg?style=for-the-badge" alt="License: MIT"></a>
  <a href="https://github.com/adaptolearning/UiH/stargazers"><img src="https://img.shields.io/github/stars/adaptolearning/UiH?style=for-the-badge" alt="GitHub stars"></a>
  <a href="https://github.com/adaptolearning/UiH/issues"><img src="https://img.shields.io/github/issues/adaptolearning/UiH?style=for-the-badge" alt="GitHub issues"></a>
</p>

---

## Features at a Glance

- **Dual API Design** - Context-free AND context-based APIs for maximum flexibility
- **Material Design 3** - Built-in MD3 breakpoints for mobile, tablet, and desktop
- **Modern Accessibility** - Uses Flutter's latest `textScaler` API with full accessibility support
- **Rich Integration** - 50+ BuildContext extensions for Theme, Navigation, and more
- **Advanced Font Scaling** - Diagonal-based and breakpoint-based strategies
- **Percentage Layouts** - Screen fraction support for fluid responsive designs
- **Multiple Naming Options** - Choose between terse, descriptive, or full names
- **Complete Toolkit** - Responsive sizing + Theme helpers + Navigation + Utilities
- **Cross-Platform** - Mobile, Web, Desktop, and Fuchsia support
- **Future-Proof** - Uses modern Flutter APIs, no deprecated code

---

## Quick Example

```dart
import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap your app once with UihInit
    return UihInit(
      designSize: const Size(414, 896), // Your design dimensions
      builder: (context) => MaterialApp(
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w), // Responsive padding
        child: Column(
          children: [
            // Responsive dimensions
            Container(
              width: 300.w,  // Scales to screen width
              height: 200.h, // Scales to screen height
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(16.w),
              ),
              child: Center(
                child: Text(
                  'Hello UiH!',
                  style: TextStyle(
                    fontSize: 24.sp, // Responsive font
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Responsive spacing
            context.verticalSpacer(size: 24),

            // Adaptive font based on device type
            Text(
              'Adaptive Typography',
              style: TextStyle(fontSize: 18.af), // Larger on tablets
            ),

            // Percentage-based layout
            Container(
              width: 0.8.wf,  // 80% of screen width
              height: 0.3.hf, // 30% of screen height
              color: context.colorScheme.secondary,
            ),

            // Adaptive layout
            if (context.isTablet || context.isDesktop)
              const Text('Tablet/Desktop Layout')
            else
              const Text('Mobile Layout'),
          ],
        ),
      ),
    );
  }
}
```

---

## Getting Started

### Installation

Add UiH to your `pubspec.yaml`:

```yaml
dependencies:
  uih: ^1.0.6
```

Then run:

```bash
flutter pub get
```

### Basic Setup

Wrap your app with `UihInit`:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UihInit(
      designSize: const Size(414, 896), // Optional, defaults to iPhone 11 Pro Max
      builder: (context) => MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
```

**Alternative:** Use with `MaterialApp.builder`:

```dart
MaterialApp(
  builder: Uih.builder(
    designSize: const Size(414, 896),
  ),
  home: HomePage(),
)
```

That's it! Now use responsive extensions anywhere in your app.

---

## Complete Feature Guide

### Responsive Sizing

Scale your UI elements proportionally across all screen sizes.

```dart
// Width scaling
Container(width: 100.w)  // Scales based on screen width

// Height scaling
Container(height: 50.h)  // Scales based on screen height

// Context-based alternative (no initialization needed)
Container(
  width: 100.rw(context),
  height: 50.rh(context),
)
```

### Font Scaling

Two powerful font scaling strategies:

#### 1. Smooth Diagonal-Based Scaling

```dart
Text(
  'Body Text',
  style: TextStyle(fontSize: 16.sp), // Scales smoothly based on screen diagonal
)

// With accessibility control
Text(
  'Icon Label',
  style: TextStyle(
    fontSize: 12.sp, // Respects user's text scale by default
  ),
)
```

#### 2. Adaptive Breakpoint-Based Scaling

```dart
Text(
  'Heading',
  style: TextStyle(fontSize: 24.af), // Scales in steps: 0.8x → 1.0x → 1.1x → 1.2x
)

// Perfect for headings on different devices:
// - Small phones (<360dp): 0.8x smaller
// - Normal phones (360-479dp): 1.0x normal
// - Large phones/tablets (480-767dp): 1.1x larger
// - Tablets/desktop (≥768dp): 1.2x much larger
```

### Percentage-Based Layouts

Create fluid layouts with screen fractions:

```dart
// 90% of screen width
Container(width: 0.9.wf)

// 30% of screen height
Container(height: 0.3.hf)

// Perfect for responsive grids
Row(
  children: [
    Container(width: 0.3.wf, child: Sidebar()),
    Container(width: 0.7.wf, child: Content()),
  ],
)
```

### Material Design 3 Breakpoints

Built-in device type detection using official Material Design 3 guidelines:

```dart
// Detect device type
if (context.isMobile) {
  // < 600dp - Phones
  return MobileLayout();
} else if (context.isTablet) {
  // 600-840dp - Tablets
  return TabletLayout();
} else {
  // ≥ 840dp - Desktop
  return DesktopLayout();
}

// Also available context-free
if (Uih.isMobile) { ... }
if (Uih.isTablet) { ... }
if (Uih.isDesktop) { ... }
```

### Theme Integration

Access Flutter theme data with clean, concise syntax:

```dart
// Color scheme
final primary = context.colorScheme.primary;
final surface = context.colorScheme.surface;
final error = context.colorScheme.error;

// Text theme
final headline = context.textTheme.headlineMedium;
final body = context.textTheme.bodyLarge;

// Theme properties
final isDark = context.brightness == Brightness.dark;
final typography = context.typography;
```

### Navigation Helpers

Simplified navigation and UI component access:

```dart
// Navigator
context.navigator.push(MaterialPageRoute(...));

// Focus
context.focusScope.unfocus();

// SnackBar (one-liner!)
context.showSnackBar(
  SnackBar(content: Text('Success!')),
);

// Scaffold
final scaffold = context.scaffold;
```

### Responsive Spacers

Semantic spacing widgets that scale with screen size:

```dart
// Horizontal spacing
Row(
  children: [
    Text('Left'),
    context.horizontalSpacer(size: 16, multiplier: 2), // 32dp spacing
    Text('Right'),
  ],
)

// Vertical spacing
Column(
  children: [
    Text('Top'),
    context.verticalSpacer(size: 24), // 24dp spacing
    Text('Bottom'),
  ],
)
```

### Screen Dimensions

Access screen measurements in various units:

```dart
// Pixels
final width = context.widthInPixels;
final height = context.heightInPixels;
final diagonal = context.diagonalInPixels;

// Inches (real-world measurements)
final widthInch = context.widthInInches;
final heightInch = context.heightInInches;
final diagonalInch = context.diagonalInInches;

// Points (platform-independent)
final size = context.sizeInPoints;
final diagonal = context.diagonalInPoints;

// Pixels per inch (platform-aware)
final ppi = context.pixelsPerInch; // 150 for mobile, 96 for desktop
```

### Orientation Detection

```dart
// Check orientation
if (context.isLandscape) {
  return LandscapeLayout();
} else {
  return PortraitLayout();
}
```

### Multiple Naming Options

Choose the naming style that fits your team's standards:

```dart
// Terse (fast coding)
Container(width: 100.w, height: 50.h)

// Descriptive (context-based)
Container(
  width: 100.rw(context),
  height: 50.rh(context),
)

// Fully descriptive (self-documenting)
Container(
  width: 100.relativeWidth(context),
  height: 50.relativeHeight(context),
)
```

---

## Bonus Utilities

### WidgetState Helpers

```dart
MaterialStateProperty.resolveWith((states) {
  if (states.isPressed) return Colors.red;
  if (states.isHovered) return Colors.blue;
  if (states.isFocused) return Colors.green;
  return Colors.grey;
});
```

### String Extensions

```dart
'user@example.com'.isEmail()  // true
'hello world'.toCamelCase()   // 'helloWorld'
'hello'.capitalize()          // 'Hello'
'Hello'.reverse()             // 'olleH'
```

### Iterable Extensions

```dart
states.containsAny([WidgetState.hovered, WidgetState.pressed])
```

---

## Dual API Design

UiH uniquely offers **both** context-free and context-based APIs. Choose what works best for your use case:

### Context-Free API (Recommended)

Perfect for most scenarios. Clean, concise syntax.

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,   // Clean and simple
      height: 50.h,
      child: Text('Hello', style: TextStyle(fontSize: 14.sp)),
    );
  }
}
```

**Requires:** One-time initialization with `UihInit` wrapper.

### Context-Based API

No initialization needed. Perfect for testing or when context is readily available.

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.rw(context),   // No initialization needed
      height: 50.rh(context),
      child: Text('Hello', style: TextStyle(fontSize: 14.sf(context))),
    );
  }
}
```

**Requires:** Nothing! Works immediately.

**Mix and match** based on your needs. Both APIs coexist perfectly.

---

## API Reference

### Numeric Extensions

All methods work with both `int` and `double`.

| Extension | Context-Free | Context-Based | Description |
|-----------|--------------|---------------|-------------|
| **Width** | `100.w` | `100.rw(context)` | Relative width scaled to design |
| **Height** | `50.h` | `50.rh(context)` | Relative height scaled to design |
| **Font (Scaled)** | `14.sp` | `14.sf(context)` | Diagonal-based font scaling |
| **Font (Adaptive)** | `24.af` | `24.afc(context)` | Breakpoint-based font scaling |
| **Width Fraction** | `0.5.wf` | `0.5.wfc(context)` | 50% of screen width |
| **Height Fraction** | `0.3.hf` | `0.3.hfc(context)` | 30% of screen height |

### BuildContext Extensions

| Extension | Type | Description |
|-----------|------|-------------|
| **Screen Dimensions** | | |
| `context.mediaQuery` | `MediaQueryData` | MediaQuery instance |
| `context.sizeInPixels` | `Size` | Screen size in pixels |
| `context.widthInPixels` | `double` | Screen width in pixels |
| `context.heightInPixels` | `double` | Screen height in pixels |
| `context.diagonalInPixels` | `double` | Screen diagonal in pixels |
| `context.sizeInPoints` | `Size` | Screen size in points |
| `context.sizeInInches` | `Size` | Screen size in inches |
| `context.widthInInches` | `double` | Screen width in inches |
| `context.heightInInches` | `double` | Screen height in inches |
| `context.diagonalInInches` | `double` | Screen diagonal in inches |
| `context.pixelsPerInch` | `double` | Platform-aware PPI |
| **Responsive Sizing** | | |
| `context.relativeWidth(value)` | `double` | Scale width to screen |
| `context.relativeHeight(value)` | `double` | Scale height to screen |
| `context.widthFraction(fraction)` | `double` | Percentage of width (0.0-1.0) |
| `context.heightFraction(fraction)` | `double` | Percentage of height (0.0-1.0) |
| **Font Scaling** | | |
| `context.scaledFontSize(size)` | `double` | Diagonal-based scaling |
| `context.adaptiveFontSize(size)` | `double` | Breakpoint-based scaling |
| **Platform Detection** | | |
| `context.isMobile` | `bool` | < 600dp (Material Design 3) |
| `context.isTablet` | `bool` | 600-840dp (Material Design 3) |
| `context.isDesktop` | `bool` | ≥ 840dp (Material Design 3) |
| `context.isLandscape` | `bool` | Landscape orientation |
| **Theme Shortcuts** | | |
| `context.theme` | `ThemeData` | Theme instance |
| `context.textTheme` | `TextTheme` | Text theme |
| `context.colorScheme` | `ColorScheme` | Color scheme |
| `context.backgroundColor` | `Color` | Background/surface color |
| `context.typography` | `Typography` | Typography |
| `context.brightness` | `Brightness` | Light/dark mode |
| **Navigation** | | |
| `context.navigator` | `NavigatorState` | Navigator instance |
| `context.focusScope` | `FocusScopeNode` | Focus scope |
| `context.scaffold` | `ScaffoldState` | Scaffold instance |
| `context.showSnackBar(snackBar)` | `void` | Show snack bar |
| **Spacing Widgets** | | |
| `context.horizontalSpacer(...)` | `SizedBox` | Horizontal spacing |
| `context.verticalSpacer(...)` | `SizedBox` | Vertical spacing |

---

## Common Design Sizes

Use these preset sizes when initializing UiH:

```dart
// iPhone 11 Pro Max (default)
UihInit(designSize: const Size(414, 896))

// iPhone X / 11 Pro
UihInit(designSize: const Size(375, 812))

// iPhone 13 / 14
UihInit(designSize: const Size(390, 844))

// Google Pixel 5
UihInit(designSize: const Size(393, 851))

// iPad Pro 11"
UihInit(designSize: const Size(834, 1194))

// Common Android
UihInit(designSize: const Size(360, 640))
```

---

## Best Practices

### 1. Initialize Once at App Root

```dart
// GOOD
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UihInit(
      builder: (context) => MaterialApp(...),
    );
  }
}

// AVOID - Don't initialize on every screen
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Uih.init(context); // Not needed!
    return Scaffold(...);
  }
}
```

### 2. Use Semantic Spacers

```dart
// BETTER - Semantic and clear
Column(
  children: [
    Widget1(),
    context.verticalSpacer(size: 16),
    Widget2(),
  ],
)

// NOTE: Works but less clear
Column(
  children: [
    Widget1(),
    SizedBox(height: 16.h),
    Widget2(),
  ],
)
```

### 3. Choose the Right Font Scaling

```dart
// Body text - Use smooth scaling
Text('Body text', style: TextStyle(fontSize: 14.sp))

// Headings - Use adaptive scaling for more prominence on tablets
Text('Heading', style: TextStyle(fontSize: 24.af))
```

### 4. Respect Accessibility

Both font scaling methods respect user accessibility settings by default:

```dart
// Respects user's text scale
Text('Hello', style: TextStyle(fontSize: 16.sp))

// Only disable if absolutely necessary (e.g., icons)
Text('Search', style: TextStyle(fontSize: 24.sp)) // Still respects by default
```

### 5. Use Material Design 3 Breakpoints

```dart
// Use built-in breakpoints
if (context.isMobile) { ... }
if (context.isTablet) { ... }
if (context.isDesktop) { ... }

// AVOID magic numbers
if (context.widthInPixels < 600) { ... } // Harder to maintain
```

---

## Troubleshooting

### "UiH has not been initialized!"

**Solution:** Wrap your app with `UihInit`:

```dart
return UihInit(
  builder: (context) => MaterialApp(...),
);
```

Or use the context-based API (no initialization needed):

```dart
Container(width: 100.rw(context))
```

### Screen doesn't adapt to rotation

**Solution:** UiH automatically handles rotation with `UihInit`. If using manual initialization, reinitialize on rotation:

```dart
// Not needed with UihInit - it handles this automatically
```

### Values seem incorrect

**Solution:** Check your design size matches your design tool:

```dart
UihInit(
  designSize: const Size(375, 812), // Match your Figma/Sketch design
  builder: (context) => MaterialApp(...),
)
```

---

## Contributing

We welcome contributions! Here's how you can help:

1. **Fork** the repository
2. **Create** your feature branch: `git checkout -b my-new-feature`
3. **Commit** your changes: `git commit -am 'Add amazing feature'`
4. **Push** to the branch: `git push origin my-new-feature`
5. **Submit** a pull request

### Development Setup

```bash
# Clone the repo
git clone https://github.com/adaptolearning/UiH.git
cd UiH

# Install dependencies
flutter pub get

# Run tests
flutter test

# Run example app
cd example
flutter run
```

### Reporting Issues

Found a bug or have a feature request? [Open an issue](https://github.com/adaptolearning/UiH/issues) on GitHub.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Show Your Support

If UiH helps you build better Flutter apps, give it a star on [GitHub](https://github.com/adaptolearning/UiH)!

---

## Additional Resources

- [pub.dev Package](https://pub.dev/packages/uih)
- [API Documentation](https://pub.dev/documentation/uih/latest/)
- [Example App](https://github.com/adaptolearning/UiH/tree/main/example)
- [Changelog](https://github.com/adaptolearning/UiH/blob/main/CHANGELOG.md)

---

<p align="center">
  Made with ❤️ by the princeteck
</p>

<p align="center">
  <a href="https://github.com/adaptolearning/UiH">GitHub</a> •
  <a href="https://pub.dev/packages/uih">pub.dev</a> •
  <a href="https://github.com/adaptolearning/UiH/issues">Issues</a>
</p>
