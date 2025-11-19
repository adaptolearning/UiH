import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uih/src/context_ext.dart';

void main() {
  group('uih extension', () {
    testWidgets('relativeHeight should return correct height',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final inputHeight = 100.0;
      final expectedHeight =
          (inputHeight / 896.0) * 800; // (100 / 896) * 800 = 89.28...

      final result = capturedContext.relativeHeight(inputHeight);

      expect(result, closeTo(expectedHeight, 0.01));
    });

    testWidgets('relativeWidth should return correct width',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final inputWidth = 100.0;
      final expectedWidth =
          (inputWidth / 414.0) * 400; // (100 / 414) * 400 = 96.618...

      final result = capturedContext.relativeWidth(inputWidth);

      expect(result, closeTo(expectedWidth, 0.01));
    });

    testWidgets('pixelsPerInch should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final result = capturedContext.pixelsPerInch;

      // Test environment defaults to mobile platform (Android/iOS)
      expect(result, equals(150.0));
    });

    testWidgets('sizeInPoints should return correct size',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 800),
            devicePixelRatio: 2.0,
          ),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final expectedSize = const Size(200.0, 400.0);

      final result = capturedContext.sizeInPoints;

      expect(result, equals(expectedSize));
    });

    testWidgets('diagonalInPoints should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 800),
            devicePixelRatio: 2.0,
          ),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      // Size in points: 200x400, diagonal = sqrt(200^2 + 400^2) = 447.213...
      final expectedDiagonal = 447.213595499958;

      final result = capturedContext.diagonalInPoints;

      expect(result, closeTo(expectedDiagonal, 0.01));
    });

    testWidgets('scaledFontSize should return correct size',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 800),
            textScaler: TextScaler.linear(1.0),
          ),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final inputFontSize = 16.0;
      // Screen diagonal: sqrt(400^2 + 800^2) = 894.427...
      // Scale factor: 894.427 / 984 = 0.909...
      // Expected: 16 * 0.909 = 14.544...
      final expectedFontSize = 14.544;

      final result = capturedContext.scaledFontSize(inputFontSize);

      expect(result, closeTo(expectedFontSize, 0.01));
    });

    testWidgets('adaptiveFontSize should return correct size',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 800),
            textScaler: TextScaler.linear(1.0),
          ),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final inputFontSize = 16.0;
      // Width 400 falls in 360-480 range, scale factor = 1.0
      final expectedFontSize = 16.0;

      final result = capturedContext.adaptiveFontSize(inputFontSize);

      expect(result, equals(expectedFontSize));
    });

    testWidgets('sizeInInches should return correct size',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      // 400 / 150 = 2.666..., 800 / 150 = 5.333...
      final expectedSize = const Size(2.6666666666666665, 5.333333333333333);

      final result = capturedContext.sizeInInches;

      expect(result.width, closeTo(expectedSize.width, 0.01));
      expect(result.height, closeTo(expectedSize.height, 0.01));
    });

    testWidgets('diagonalInPixels should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final expectedDiagonal = 894.4271909999159;

      final result = capturedContext.diagonalInPixels;

      expect(result, closeTo(expectedDiagonal, 0.01));
    });

    testWidgets('widthInPixels should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final expectedWidth = 400.0;

      final result = capturedContext.widthInPixels;

      expect(result, equals(expectedWidth));
    });

    testWidgets('heightInPixels should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final expectedHeight = 800.0;

      final result = capturedContext.heightInPixels;

      expect(result, equals(expectedHeight));
    });

    testWidgets('widthInInches should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      // 400 / 150 = 2.666...
      final expectedWidth = 2.6666666666666665;

      final result = capturedContext.widthInInches;

      expect(result, closeTo(expectedWidth, 0.01));
    });

    testWidgets('heightInInches should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      // 800 / 150 = 5.333...
      final expectedHeight = 5.333333333333333;

      final result = capturedContext.heightInInches;

      expect(result, closeTo(expectedHeight, 0.01));
    });

    testWidgets('diagonalInInches should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      // 894.427... / 150 = 5.962...
      final expectedDiagonal = 5.962847939999439;

      final result = capturedContext.diagonalInInches;

      expect(result, closeTo(expectedDiagonal, 0.01));
    });

    testWidgets('widthFraction should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final fraction = 0.5;
      final expectedWidth = 200.0;

      final result = capturedContext.widthFraction(fraction);

      expect(result, equals(expectedWidth));
    });

    testWidgets('heightFraction should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final fraction = 0.5;
      final expectedHeight = 400.0;

      final result = capturedContext.heightFraction(fraction);

      expect(result, equals(expectedHeight));
    });

    testWidgets('isLandscape should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(800, 400),
            // Orientation is determined by size automatically
          ),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final result = capturedContext.isLandscape;

      expect(result, equals(true));
    });

    testWidgets('horizontalSpacer should return correct widget',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      // relativeWidth(10) = (10 / 414) * 400 = 9.661...
      final expectedWidth = 9.661835748792271;

      final result = capturedContext.horizontalSpacer();

      expect(result, isA<SizedBox>());
      expect(result.width, closeTo(expectedWidth, 0.01));
    });

    testWidgets('verticalSpacer should return correct widget',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      // relativeHeight(10) = (10 / 896) * 800 = 8.928...
      final expectedHeight = 8.928571428571429;

      final result = capturedContext.verticalSpacer();

      expect(result, isA<SizedBox>());
      expect(result.height, closeTo(expectedHeight, 0.01));
    });

    testWidgets('isMobile should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final result = capturedContext.isMobile;

      expect(result, equals(true));
    });

    testWidgets('isTablet should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(800, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final result = capturedContext.isTablet;

      expect(result, equals(true));
    });

    testWidgets('isDesktop should return correct value',
        (WidgetTester tester) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1200, 800)),
          child: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final result = capturedContext.isDesktop;

      expect(result, equals(true));
    });
  });
}
