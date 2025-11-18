import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uih/src/context_ext.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('uih extension', () {
    test('relativeHeight should return correct height', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      when(mq.size).thenReturn(const Size(400, 800));
      when(MediaQuery.of(context)).thenReturn(mq);

      final inputHeight = 100.0;
      final expectedHeight = (inputHeight / 896.0) * 800; // (100 / 896) * 800 = 89.28...

      final result = context.relativeHeight(inputHeight);

      expect(result, closeTo(expectedHeight, 0.01));
    });

    test('relativeWidth should return correct width', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final inputWidth = 100.0;
      final expectedWidth = 24.154589371980676;

      final result = context.relativeWidth(inputWidth);

      expect(result, equals(expectedWidth));
    });

    test('pixelsPerInch should return correct value', () {
      final context = MockBuildContext();

      final result = context.pixelsPerInch;

      // Test environment defaults to mobile platform (Android/iOS)
      expect(result, equals(150.0));
    });

    test('sizeInPoints should return correct size', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final expectedSize = Size(3.125, 6.25);

      final result = context.sizeInPoints;

      expect(result, equals(expectedSize));
    });

    test('diagonalInPoints should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final expectedDiagonal = 894.4271909999159;

      final result = context.diagonalInPoints;

      expect(result, equals(expectedDiagonal));
    });

    test('scaledFontSize should return correct size', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final inputFontSize = 16.0;
      final expectedFontSize = 18.0;

      final result = context.scaledFontSize(inputFontSize);

      expect(result, equals(expectedFontSize));
    });

    test('adaptiveFontSize should return correct size', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final inputFontSize = 16.0;
      final expectedFontSize = 19.2;

      final result = context.adaptiveFontSize(inputFontSize);

      expect(result, equals(expectedFontSize));
    });

    test('sizeInInches should return correct size', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final expectedSize = Size(1.0416666666666667, 2.0833333333333335);

      final result = context.sizeInInches;

      expect(result, equals(expectedSize));
    });

    test('diagonalInPixels should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final expectedDiagonal = 894.4271909999159;

      final result = context.diagonalInPixels;

      expect(result, equals(expectedDiagonal));
    });

    test('widthInPixels should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final expectedWidth = 400.0;

      final result = context.widthInPixels;

      expect(result, equals(expectedWidth));
    });

    test('heightInPixels should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final expectedHeight = 800.0;

      final result = context.heightInPixels;

      expect(result, equals(expectedHeight));
    });

    test('widthInInches should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final expectedWidth = 3.125;

      final result = context.widthInInches;

      expect(result, equals(expectedWidth));
    });

    test('heightInInches should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final expectedHeight = 6.25;

      final result = context.heightInInches;

      expect(result, equals(expectedHeight));
    });

    test('diagonalInInches should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final expectedDiagonal = 9.33134693877551;

      final result = context.diagonalInInches;

      expect(result, equals(expectedDiagonal));
    });

    test('widthFraction should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final fraction = 0.5;
      final expectedWidth = 200.0;

      final result = context.widthFraction(fraction);

      expect(result, equals(expectedWidth));
    });

    test('heightFraction should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final fraction = 0.5;
      final expectedHeight = 400.0;

      final result = context.heightFraction(fraction);

      expect(result, equals(expectedHeight));
    });

    // test('isLandscape should return correct value', () {
    //   final context = MockBuildContext();
    //   final mq = MockMediaQueryData();
    //   mq.orientation = Orientation.landscape;
    //   when(context.mediaQuery).thenReturn(mq);
    //   ) as MockMediaQueryData;
    //   final result = context.isLandscape;

    //   expect(result, equals(true));
    // });

    test('horizontalSpacer should return correct widget', () {
      final context = MockBuildContext();
      final expectedWidth = 10.0;

      final result = context.horizontalSpacer();

      expect(result, isA<SizedBox>());
      expect(result.width, equals(expectedWidth));
    });

    test('verticalSpacer should return correct widget', () {
      final context = MockBuildContext();
      final expectedHeight = 10.0;

      final result = context.verticalSpacer();

      expect(result, isA<SizedBox>());
      expect(result.height, equals(expectedHeight));
    });

    test('isMobile should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mediaQuery).thenReturn(mq);

      final result = context.isMobile;

      expect(result, equals(true));
    });

    test('isTablet should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(800, 800));
      when(context.mediaQuery).thenReturn(mq);

      final result = context.isTablet;

      expect(result, equals(true));
    });

    test('isDesktop should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(1200, 800));
      when(context.mediaQuery).thenReturn(mq);

      final result = context.isDesktop;

      expect(result, equals(true));
    });

    // test('backgroundColor should return correct color', () {
    //   final context = MockBuildContext();
    //   final theme = MockThemeData();
    //   theme.copyWith(
    //       colorScheme: ColorScheme.light().copyWith(background: Colors.red));
    //   when(context.theme).thenReturn(theme);

    //   final result = context.backgroundColor;

    //   expect(result, equals(Colors.red));
    // });

    // test('typography should return correct typography', () {
    //   final context = MockBuildContext();
    //   final theme = MockThemeData();
    //   theme.copyWith(typography: Typography.material2018());
    //   when(context.theme).thenReturn(theme);

    //   final result = context.typography;

    //   expect(result, equals(Typography.material2018()));
    // });

    // test('brightness should return correct brightness', () {
    //   final context = MockBuildContext();
    //   final theme = MockThemeData();
    //   theme.copyWith(brightness: Brightness.dark);
    //   when(context.theme).thenReturn(theme);

    //   final result = context.brightness;

    //   expect(result, equals(Brightness.dark));
    // });

    // test('showSnackBar should call ScaffoldMessenger.showSnackBar', () {
    //   final context = MockBuildContext();
    //   final scaffoldMessenger = MockScaffoldMessengerState();
    //   final child = SnackBar(content: Text('Test'));
    //   when(context.showSnackBar(child)).thenAnswer((_) => null);
    //   when(context.findAncestorStateOfType<ScaffoldMessengerState>())
    //       .thenReturn(scaffoldMessenger);

    //   context.showSnackBar(child);

    //   verify(scaffoldMessenger.showSnackBar(child));
    // });
  });
}

class MockBuildContext extends Mock implements BuildContext {}

// ignore: must_be_immutable
class MockMediaQueryData extends Mock implements MediaQueryData {}

// class MockThemeData implements Mock, ThemeData {}

// class MockScaffoldMessengerState implements Mock, ScaffoldMessengerState {}
