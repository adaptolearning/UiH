import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uih/src/context_ext.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('uih extension', () {
    test('relativeScreenHeight should return correct height', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final inputHeight = 100.0;
      final expectedHeight = 44.642857142857146;

      final result = context.relativeScreenHeight(inputHeight);

      expect(result, equals(expectedHeight));
    });

    test('relativeScreenWidth should return correct width', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final inputWidth = 100.0;
      final expectedWidth = 24.154589371980676;

      final result = context.relativeScreenWidth(inputWidth);

      expect(result, equals(expectedWidth));
    });

    test('pixelsPerInch should return correct value', () {
      final context = MockBuildContext();

      final result = context.pixelsPerInch;

      expect(result, equals(96));
    });

    test('sizePoints should return correct size', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final expectedSize = Size(3.125, 6.25);

      final result = context.sizePoints;

      expect(result, equals(expectedSize));
    });

    test('diagonalPoints should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final expectedDiagonal = 894.4271909999159;

      final result = context.diagonalPoints;

      expect(result, equals(expectedDiagonal));
    });

    test('relativeFontSize should return correct size', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final inputFontSize = 16.0;
      final expectedFontSize = 18.0;

      final result = context.relativeFontSize(inputFontSize);

      expect(result, equals(expectedFontSize));
    });

    test('relativeFontSizeWithBreakPoint should return correct size', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final inputFontSize = 16.0;
      final expectedFontSize = 19.2;

      final result = context.relativeFontSizeWithBreakPoint(inputFontSize);

      expect(result, equals(expectedFontSize));
    });

    test('sizeInches should return correct size', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final expectedSize = Size(1.0416666666666667, 2.0833333333333335);

      final result = context.sizeInches;

      expect(result, equals(expectedSize));
    });

    test('diagonalPx should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final expectedDiagonal = 894.4271909999159;

      final result = context.diagonalPx;

      expect(result, equals(expectedDiagonal));
    });

    test('widthPx should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final expectedWidth = 400.0;

      final result = context.widthPx;

      expect(result, equals(expectedWidth));
    });

    test('heightPx should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final expectedHeight = 800.0;

      final result = context.heightPx;

      expect(result, equals(expectedHeight));
    });

    test('widthInches should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final expectedWidth = 3.125;

      final result = context.widthInches;

      expect(result, equals(expectedWidth));
    });

    test('heightInches should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final expectedHeight = 6.25;

      final result = context.heightInches;

      expect(result, equals(expectedHeight));
    });

    test('diagonalInches should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final expectedDiagonal = 9.33134693877551;

      final result = context.diagonalInches;

      expect(result, equals(expectedDiagonal));
    });

    test('widthPct should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final fraction = 0.5;
      final expectedWidth = 200.0;

      final result = context.widthPct(fraction);

      expect(result, equals(expectedWidth));
    });

    test('heightPct should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(400, 800));
      when(context.mq).thenReturn(mq);

      final fraction = 0.5;
      final expectedHeight = 400.0;

      final result = context.heightPct(fraction);

      expect(result, equals(expectedHeight));
    });

    // test('isLandscape should return correct value', () {
    //   final context = MockBuildContext();
    //   final mq = MockMediaQueryData();
    //   mq.orientation = Orientation.landscape;
    //   when(context.mq).thenReturn(mq);
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
      when(context.mq).thenReturn(mq);

      final result = context.isMobile;

      expect(result, equals(true));
    });

    test('isTablet should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(800, 800));
      when(context.mq).thenReturn(mq);

      final result = context.isTablet;

      expect(result, equals(true));
    });

    test('isDesktop should return correct value', () {
      final context = MockBuildContext();
      final mq = MockMediaQueryData();
      mq.copyWith(size: Size(1200, 800));
      when(context.mq).thenReturn(mq);

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
