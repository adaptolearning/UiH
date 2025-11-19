import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uih/uih.dart';

void main() {
  group('UihInit Widget Tests', () {
    testWidgets('UihInit should automatically initialize UiH', (tester) async {
      // Reset UiH state before test
      Uih.reset();

      // Verify UiH is not initialized initially
      expect(Uih.isInitialized, false);

      // Build app with UihInit
      await tester.pumpWidget(
        UihInit(
          designSize: const Size(414, 896),
          builder: (context) => MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  // UiH should be initialized now
                  return Container(
                    width: 100.w,
                    height: 50.h,
                    child: Text(
                      'Test',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Verify UiH is initialized
      expect(Uih.isInitialized, true);

      // Verify design dimensions are set
      expect(Uih.designWidth, 414.0);
      expect(Uih.designHeight, 896.0);
    });

    testWidgets('UihInit should use default design size', (tester) async {
      // Reset UiH state before test
      Uih.reset();

      // Build app with UihInit using defaults
      await tester.pumpWidget(
        UihInit(
          builder: (context) => const MaterialApp(
            home: Scaffold(
              body: Text('Test'),
            ),
          ),
        ),
      );

      // Verify default design dimensions
      expect(Uih.designWidth, 414.0);
      expect(Uih.designHeight, 896.0);
    });

    testWidgets('UihInit should allow custom design size', (tester) async {
      // Reset UiH state before test
      Uih.reset();

      // Build app with UihInit using custom design size
      await tester.pumpWidget(
        UihInit(
          designSize: const Size(375, 812),
          builder: (context) => const MaterialApp(
            home: Scaffold(
              body: Text('Test'),
            ),
          ),
        ),
      );

      // Verify custom design dimensions
      expect(Uih.designWidth, 375.0);
      expect(Uih.designHeight, 812.0);
    });

    testWidgets('Context-free extensions should work after UihInit',
        (tester) async {
      // Reset UiH state before test
      Uih.reset();

      await tester.pumpWidget(
        UihInit(
          designSize: const Size(414, 896),
          builder: (context) => MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  // These should all work without throwing exceptions
                  final w = 100.w;
                  final h = 50.h;
                  final sp = 14.sp;
                  final af = 16.af;
                  final wf = 0.5.wf;
                  final hf = 0.3.hf;

                  return Column(
                    children: [
                      Container(width: w, height: h),
                      Text('Test', style: TextStyle(fontSize: sp)),
                      Text('Test2', style: TextStyle(fontSize: af)),
                      Container(width: wf, height: hf),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );

      // If we get here without exceptions, the test passes
      expect(Uih.isInitialized, true);
    });
  });

  group('Uih.builder() Tests', () {
    testWidgets('Uih.builder() should initialize UiH', (tester) async {
      // Reset UiH state before test
      Uih.reset();

      await tester.pumpWidget(
        MaterialApp(
          builder: Uih.builder(
            designSize: const Size(414, 896),
          ),
          home: const Scaffold(
            body: Text('Test'),
          ),
        ),
      );

      // Verify UiH is initialized
      expect(Uih.isInitialized, true);
      expect(Uih.designWidth, 414.0);
      expect(Uih.designHeight, 896.0);
    });

    testWidgets('Uih.builder() should use default design size', (tester) async {
      // Reset UiH state before test
      Uih.reset();

      await tester.pumpWidget(
        MaterialApp(
          builder: Uih.builder(),
          home: const Scaffold(
            body: Text('Test'),
          ),
        ),
      );

      // Verify default design dimensions
      expect(Uih.designWidth, 414.0);
      expect(Uih.designHeight, 896.0);
    });
  });

  group('Error Handling Tests', () {
    testWidgets('Should throw UihNotInitializedException when not initialized',
        (tester) async {
      // Reset UiH state
      Uih.reset();

      // Try to use context-free extension without initialization
      expect(() => 100.w, throwsA(isA<UihNotInitializedException>()));
      expect(() => 50.h, throwsA(isA<UihNotInitializedException>()));
      expect(() => 14.sp, throwsA(isA<UihNotInitializedException>()));
      expect(() => 16.af, throwsA(isA<UihNotInitializedException>()));
      expect(() => 0.5.wf, throwsA(isA<UihNotInitializedException>()));
      expect(() => 0.3.hf, throwsA(isA<UihNotInitializedException>()));
    });

    test('UihNotInitializedException should have helpful message', () {
      final exception = UihNotInitializedException('Test message');
      expect(exception.message, 'Test message');
      expect(exception.toString(), contains('UihNotInitializedException'));
      expect(exception.toString(), contains('Test message'));
    });
  });
}
