# CHANGELOG

### [1.0.6] - 2025-01-19 Release

#### Critical Bug Fixes

* **CRITICAL**: Fixed `roundToDecimalPlaces()` bug in `double_ext.dart` - was using multiplication instead of `pow()` function, causing incorrect rounding results.
* Added `dart:math` import for `pow()` function and `pi` constant.
* Replaced all hard-coded pi values (3.141592653589793238) with `math.pi` constant.

#### Code Quality Improvements

* Removed unnecessary `this.` prefixes for cleaner, more idiomatic Dart code.
* Standardized all extension naming to PascalCase with 'Uih' prefix:
  * `uihDouble` → `UihDoubleExtension`
  * `uihInt` → `UihIntExtension`
  * `uihString` → `UihStringExtension`
  * `WidgetStateHelpers` → `UihWidgetStateExtension`
  * `IterableExtensions` → `UihIterableExtension`

#### Comprehensive Test Coverage (176 total tests, all passing)

* **New Unit Tests** (130 tests, 100% coverage of extension methods):
  * `test/double_ext_test.dart` - 46 tests covering all 6 methods
  * `test/int_ext_test.dart` - 16 tests covering both methods
  * `test/string_ext_test.dart` - 30 tests covering all 5 methods
  * `test/iterable_ext_test.dart` - 38 tests covering all extensions
* **Fixed Pre-existing Tests**:
  * Fixed all 20 failing tests in `test/uih_test.dart`
  * Replaced improper Mockito mocking with proper Flutter widget testing
  * Converted all unit tests to widget tests using `testWidgets()`
  * Used real MediaQuery widgets instead of mocks for accurate testing
  * Re-enabled and fixed `isLandscape` test
  * Removed mockito dependency

#### Example App Redesign

* **Complete Redesign**:
  * Removed old example folder
  * Created fresh Flutter project with latest template (Flutter 3.10+)
  * Refactored from 1 monolithic file (1,083 lines) to 21 modular files
  * Professional file organization with pages/ and widgets/ directories
  * Implemented barrel exports pattern for clean imports
* **New Example Features**:
  * Responsive Sizing page with side-by-side comparisons
  * Font Scaling page with .sp and .af visual demonstrations
  * Device Detection page with Material Design 3 breakpoints
  * Theme Integration page showcasing color schemes
  * Extensions Showcase page with interactive examples
* **UI/UX Excellence**:
  * Professional card-based comparison widgets
  * Material Design 3 compliant with semantic color usage
  * Clean visual hierarchy and generous spacing
  * Perfect dark mode support
  * WCAG AA accessibility compliance
  * 100% theme integration (zero hardcoded colors)

#### Design & Visual Improvements

* Added professional font comparison widgets (`ScaledFontComparison`, `AdaptiveFontComparison`)
* Implemented comprehensive color scheme audit - replaced all hardcoded colors with theme colors
* Added proper `crossAxisAlignment: CrossAxisAlignment.start` to all Column widgets
* Modern API usage: all `withOpacity()` replaced with `withValues(alpha:)`

#### Documentation

* Added comprehensive documentation comments to all public classes
* Updated README with new features and examples
* Added context-free API documentation with `UihInit` wrapper
* Added `num_ext.dart` with dual API support (context-free and context-based)
* Added `uih_config.dart` with Uih static class for global state management

#### Quality Assurance

* Flutter analyze: 0 issues found
* All 176 tests passing (100% pass rate)
* Zero deprecated API usage
* Production-ready code quality
* Version bumped to `1.0.6`

### [1.0.5] - 2023-06-11 Release

* Task: added `textTheme` Instance.
* Task: added `colorScheme` Instance.
* Task: added `defaultTextStyle` Instance.
* Task: added `navigator` Instance.
* Task: added `focusScope` Instance.
* Task: added `scaffold` Instance.
* Task: added `context_ext` as separate file and exported it.
* Task: added `int_ext` as separate file and exported it to introduce `times`, and `timesReverse`.
* Task: added `string_ext` as separate file and exported it to introduce `isEmail`, `containsIgnoreCase`, `toCamelCase`, `capitalize`, and `reverse`.
* Task: added `double_ext` as separate file and exported it to introduce `roundToDecimalPlaces`, `toPercentage`, `isInteger`, `toRadians`, `toDegrees`, and `formatDecimalPlaces`.
* Task: added `iterable_ext` as separate file and exported it to introduce `IterableExtensions`, and `WidgetStateHelpers`.
* Task: `UiH` Logo introduced.
* Task: `README.md` updated.
* Task: version bumped to `1.0.5`.

### [1.0.4] - 2023-05-31 Release

* Task: added `RelativeFontSize` functionality.
* Task: added `RelativeFontSizeWithBreakPoint` functionality.
* Task: updated example.
* Task: added initial unit_test for future reference.
* Task: version bumped to `1.0.4`.

### [1.0.3] - 2022-10-26 Release

* Task: Scaffold Messenger section Supporting `showSnackBar`.
* Task: added example.
* Task: version bumped to `1.0.3`.

### [1.0.2] - 2022-10-26 Release

* Task: Theme section added with current variables as following : `theme`, `backgroundColor`, `typography`, `brightness`.
* Task: added example.
* Task: .pubignore introduced.
* Task: version bumped to `1.0.2`.

### [1.0.1] - 2022-10-25 Release

* Task: added bool identifiers such as `isMobile`, `isTablet`, and `isDesktop`.
* Task: added example.
* Task: version bumped to `1.0.1`.

### [1.0.0] - 2022-10-21 Release

* Task: removed old code implementation.
* Task: added extension-based implementation.
* Task: added example.
* Task: version bumped to `1.0.0`.

### [0.1.2] - 2021-05-23 Release

* Task: Added Vertical and Horizontal Spacer widget support.
* Task: Meta Data updated.

### [0.1.1] - 2021-03-14 Release

* Task: README updated.
* Task: Meta Data updated.

### [0.1.0] - 2021-03-14 Release

* Task: Initial release.
* Task: License added.
* Task: Change log Updated.
