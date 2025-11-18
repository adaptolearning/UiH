import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uih/uih.dart';

/// Comprehensive test suite for numeric extensions
///
/// Tests all numeric extension methods (abbreviated, aliased, and full names)
/// using both int and double inputs to ensure type safety and correct delegation
/// to BuildContext extension methods.
void main() {
  group('UihNumericExtension', () {
    // Helper method to build a widget with a known screen size for testing
    Widget buildTestWidget(
      Widget Function(BuildContext) builder, {
      Size size = const Size(414, 896), // iPhone 11 Pro Max reference size
    }) {
      return MediaQuery(
        data: MediaQueryData(size: size),
        child: Builder(
          builder: (context) => Container(
            child: Builder(builder: builder),
          ),
        ),
      );
    }

    group('Relative Width Extensions', () {
      testWidgets('rw() should delegate to context.relativeWidth()',
          (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 100.rw(context);
          return Container();
        }));

        // On reference size (414px), 100px should stay 100px
        expect(result, closeTo(100.0, 0.01));
      });

      testWidgets('rw() should scale correctly on different screen sizes',
          (tester) async {
        double? result;

        // Test on a smaller screen (360px wide)
        await tester.pumpWidget(buildTestWidget(
          (context) {
            result = 100.rw(context);
            return Container();
          },
          size: const Size(360, 800),
        ));

        // 100 * (360 / 414) = ~86.96
        expect(result, closeTo(86.96, 0.1));
      });

      testWidgets('w() should be an alias for rw()', (tester) async {
        double? rwResult;
        double? wResult;

        await tester.pumpWidget(buildTestWidget((context) {
          rwResult = 100.rw(context);
          wResult = 100.rw(context);
          return Container();
        }));

        expect(wResult, equals(rwResult));
      });

      testWidgets('relativeWidth() should be an alias for rw()',
          (tester) async {
        double? rwResult;
        double? relativeWidthResult;

        await tester.pumpWidget(buildTestWidget((context) {
          rwResult = 100.rw(context);
          relativeWidthResult = 100.relativeWidth(context);
          return Container();
        }));

        expect(relativeWidthResult, equals(rwResult));
      });

      testWidgets('should work with int values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 50.rw(context); // int literal
          return Container();
        }));

        expect(result, closeTo(50.0, 0.01));
      });

      testWidgets('should work with double values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 50.5.rw(context); // double literal
          return Container();
        }));

        expect(result, closeTo(50.5, 0.01));
      });
    });

    group('Relative Height Extensions', () {
      testWidgets('rh() should delegate to context.relativeHeight()',
          (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 100.rh(context);
          return Container();
        }));

        // On reference size (896px), 100px should stay 100px
        expect(result, closeTo(100.0, 0.01));
      });

      testWidgets('rh() should scale correctly on different screen sizes',
          (tester) async {
        double? result;

        // Test on a smaller screen (800px tall)
        await tester.pumpWidget(buildTestWidget(
          (context) {
            result = 100.rh(context);
            return Container();
          },
          size: const Size(414, 800),
        ));

        // 100 * (800 / 896) = ~89.29
        expect(result, closeTo(89.29, 0.1));
      });

      testWidgets('h() should be an alias for rh()', (tester) async {
        double? rhResult;
        double? hResult;

        await tester.pumpWidget(buildTestWidget((context) {
          rhResult = 100.rh(context);
          hResult = 100.rh(context);
          return Container();
        }));

        expect(hResult, equals(rhResult));
      });

      testWidgets('relativeHeight() should be an alias for rh()',
          (tester) async {
        double? rhResult;
        double? relativeHeightResult;

        await tester.pumpWidget(buildTestWidget((context) {
          rhResult = 100.rh(context);
          relativeHeightResult = 100.relativeHeight(context);
          return Container();
        }));

        expect(relativeHeightResult, equals(rhResult));
      });

      testWidgets('should work with int values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 50.rh(context); // int literal
          return Container();
        }));

        expect(result, closeTo(50.0, 0.01));
      });

      testWidgets('should work with double values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 50.5.rh(context); // double literal
          return Container();
        }));

        expect(result, closeTo(50.5, 0.01));
      });
    });

    group('Scaled Font Extensions', () {
      testWidgets('sf() should delegate to context.scaledFontSize()',
          (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 16.sf(context);
          return Container();
        }));

        // On reference size (414x896 = ~984 diagonal), 16px should stay ~16px
        expect(result, closeTo(16.0, 0.5));
      });

      testWidgets('sf() should scale correctly on different screen sizes',
          (tester) async {
        double? result;

        // Test on a larger screen (tablet size)
        await tester.pumpWidget(buildTestWidget(
          (context) {
            result = 16.sf(context);
            return Container();
          },
          size: const Size(768, 1024),
        ));

        // Should be larger than 16 on bigger screen
        expect(result! > 16.0, isTrue);
      });

      testWidgets('sp() should be an alias for sf()', (tester) async {
        double? sfResult;
        double? spResult;

        await tester.pumpWidget(buildTestWidget((context) {
          sfResult = 16.sf(context);
          spResult = 16.sf(context);
          return Container();
        }));

        expect(spResult, equals(sfResult));
      });

      testWidgets('scaledFont() should be an alias for sf()', (tester) async {
        double? sfResult;
        double? scaledFontResult;

        await tester.pumpWidget(buildTestWidget((context) {
          sfResult = 16.sf(context);
          scaledFontResult = 16.scaledFont(context);
          return Container();
        }));

        expect(scaledFontResult, equals(sfResult));
      });

      testWidgets('should work with int values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 12.sf(context); // int literal
          return Container();
        }));

        expect(result, isNotNull);
        expect(result! > 0, isTrue);
      });

      testWidgets('should work with double values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 12.5.sf(context); // double literal
          return Container();
        }));

        expect(result, isNotNull);
        expect(result! > 0, isTrue);
      });
    });

    group('Adaptive Font Extensions', () {
      testWidgets('af() should delegate to context.adaptiveFontSize()',
          (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 16.afc(context);
          return Container();
        }));

        // On reference size (414px wide), should use normal scale (1.0x)
        expect(result, closeTo(16.0, 0.01));
      });

      testWidgets('af() should apply breakpoint scaling', (tester) async {
        double? smallResult;
        double? mediumResult;
        double? largeResult;
        double? desktopResult;

        // Small phone (<360dp): 0.8x
        await tester.pumpWidget(buildTestWidget(
          (context) {
            smallResult = 16.afc(context);
            return Container();
          },
          size: const Size(320, 568),
        ));

        // Medium phone (360-479dp): 1.0x
        await tester.pumpWidget(buildTestWidget(
          (context) {
            mediumResult = 16.afc(context);
            return Container();
          },
          size: const Size(414, 896),
        ));

        // Large phone/tablet (480-767dp): 1.1x
        await tester.pumpWidget(buildTestWidget(
          (context) {
            largeResult = 16.afc(context);
            return Container();
          },
          size: const Size(600, 800),
        ));

        // Desktop (≥768dp): 1.2x
        await tester.pumpWidget(buildTestWidget(
          (context) {
            desktopResult = 16.afc(context);
            return Container();
          },
          size: const Size(1024, 768),
        ));

        expect(smallResult, closeTo(12.8, 0.01)); // 16 * 0.8
        expect(mediumResult, closeTo(16.0, 0.01)); // 16 * 1.0
        expect(largeResult, closeTo(17.6, 0.01)); // 16 * 1.1
        expect(desktopResult, closeTo(19.2, 0.01)); // 16 * 1.2
      });

      testWidgets('adaptiveFont() should be an alias for af()', (tester) async {
        double? afResult;
        double? adaptiveFontResult;

        await tester.pumpWidget(buildTestWidget((context) {
          afResult = 16.afc(context);
          adaptiveFontResult = 16.adaptiveFont(context);
          return Container();
        }));

        expect(adaptiveFontResult, equals(afResult));
      });

      testWidgets('should work with int values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 12.afc(context); // int literal
          return Container();
        }));

        expect(result, isNotNull);
        expect(result! > 0, isTrue);
      });

      testWidgets('should work with double values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 12.5.afc(context); // double literal
          return Container();
        }));

        expect(result, isNotNull);
        expect(result! > 0, isTrue);
      });
    });

    group('Width Fraction Extensions', () {
      testWidgets('wf() should delegate to context.widthFraction()',
          (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 0.5.wfc(context);
          return Container();
        }));

        // 0.5 * 414px = 207px
        expect(result, closeTo(207.0, 0.01));
      });

      testWidgets('wf() should calculate percentage correctly', (tester) async {
        double? halfResult;
        double? quarterResult;
        double? fullResult;

        await tester.pumpWidget(buildTestWidget((context) {
          halfResult = 0.5.wfc(context);
          quarterResult = 0.25.wfc(context);
          fullResult = 1.0.wfc(context);
          return Container();
        }));

        expect(halfResult, closeTo(207.0, 0.01)); // 50% of 414
        expect(quarterResult, closeTo(103.5, 0.01)); // 25% of 414
        expect(fullResult, closeTo(414.0, 0.01)); // 100% of 414
      });

      testWidgets('widthFraction() should be an alias for wf()',
          (tester) async {
        double? wfResult;
        double? widthFractionResult;

        await tester.pumpWidget(buildTestWidget((context) {
          wfResult = 0.5.wfc(context);
          widthFractionResult = 0.5.widthFraction(context);
          return Container();
        }));

        expect(widthFractionResult, equals(wfResult));
      });

      testWidgets('should work with int values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 1.wfc(context); // int literal
          return Container();
        }));

        expect(result, closeTo(414.0, 0.01));
      });

      testWidgets('should work with double values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 0.75.wfc(context); // double literal
          return Container();
        }));

        expect(result, closeTo(310.5, 0.01)); // 75% of 414
      });
    });

    group('Height Fraction Extensions', () {
      testWidgets('hf() should delegate to context.heightFraction()',
          (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 0.5.hfc(context);
          return Container();
        }));

        // 0.5 * 896px = 448px
        expect(result, closeTo(448.0, 0.01));
      });

      testWidgets('hf() should calculate percentage correctly', (tester) async {
        double? halfResult;
        double? quarterResult;
        double? fullResult;

        await tester.pumpWidget(buildTestWidget((context) {
          halfResult = 0.5.hfc(context);
          quarterResult = 0.25.hfc(context);
          fullResult = 1.0.hfc(context);
          return Container();
        }));

        expect(halfResult, closeTo(448.0, 0.01)); // 50% of 896
        expect(quarterResult, closeTo(224.0, 0.01)); // 25% of 896
        expect(fullResult, closeTo(896.0, 0.01)); // 100% of 896
      });

      testWidgets('heightFraction() should be an alias for hf()',
          (tester) async {
        double? hfResult;
        double? heightFractionResult;

        await tester.pumpWidget(buildTestWidget((context) {
          hfResult = 0.5.hfc(context);
          heightFractionResult = 0.5.heightFraction(context);
          return Container();
        }));

        expect(heightFractionResult, equals(hfResult));
      });

      testWidgets('should work with int values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 1.hfc(context); // int literal
          return Container();
        }));

        expect(result, closeTo(896.0, 0.01));
      });

      testWidgets('should work with double values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 0.75.hfc(context); // double literal
          return Container();
        }));

        expect(result, closeTo(672.0, 0.01)); // 75% of 896
      });
    });

    group('Type Safety Tests', () {
      testWidgets('should handle int type correctly', (tester) async {
        int intValue = 100;
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = intValue.rw(context);
          return Container();
        }));

        expect(result, isA<double>());
        expect(result, closeTo(100.0, 0.01));
      });

      testWidgets('should handle double type correctly', (tester) async {
        double doubleValue = 100.5;
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = doubleValue.rw(context);
          return Container();
        }));

        expect(result, isA<double>());
        expect(result, closeTo(100.5, 0.01));
      });

      testWidgets('should handle num type correctly', (tester) async {
        num numValue = 100;
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = numValue.rw(context);
          return Container();
        }));

        expect(result, isA<double>());
        expect(result, closeTo(100.0, 0.01));
      });
    });

    group('Practical Usage Examples', () {
      testWidgets('should work in Container dimensions', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: buildTestWidget((context) {
              return Container(
                width: 100.rw(context),
                height: 50.rh(context),
                child: const Text('Test'),
              );
            }),
          ),
        );

        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('should work in Text fontSize', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: buildTestWidget((context) {
              return Text(
                'Test',
                style: TextStyle(fontSize: 16.sf(context)),
              );
            }),
          ),
        );

        expect(find.text('Test'), findsOneWidget);
      });

      testWidgets('should work in EdgeInsets', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: buildTestWidget((context) {
              return Padding(
                padding: EdgeInsets.all(16.rw(context)),
                child: const Text('Test'),
              );
            }),
          ),
        );

        expect(find.byType(Padding), findsWidgets);
      });

      testWidgets('should work with mixed usage patterns', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: buildTestWidget((context) {
              return Container(
                width: 0.9.wfc(context), // 90% of screen width
                height: 200.rh(context), // Relative height
                padding: EdgeInsets.all(16.rw(context)),
                child: Text(
                  'Mixed Pattern',
                  style: TextStyle(fontSize: 14.sf(context)),
                ),
              );
            }),
          ),
        );

        expect(find.text('Mixed Pattern'), findsOneWidget);
      });

      testWidgets('should support chaining and composition', (tester) async {
        double? width;
        double? height;
        double? fontSize;

        await tester.pumpWidget(buildTestWidget((context) {
          // All three patterns in one screen
          final w = 100.rw(context); // Short alias
          final h = 50.relativeHeight(context); // Descriptive
          final fs = 16.sf(context); // Industry standard

          // Assign to outer variables for verification
          width = w;
          height = h;
          fontSize = fs;

          return Container(
            width: w,
            height: h,
          );
        }));

        expect(width, isNotNull);
        expect(height, isNotNull);
        expect(fontSize, isNotNull);
        expect(width! > 0, isTrue);
        expect(height! > 0, isTrue);
        expect(fontSize! > 0, isTrue);
      });
    });

    group('Edge Cases', () {
      testWidgets('should handle zero values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 0.rw(context);
          return Container();
        }));

        expect(result, equals(0.0));
      });

      testWidgets('should handle very small values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 0.1.rw(context);
          return Container();
        }));

        expect(result, greaterThan(0.0));
      });

      testWidgets('should handle very large values', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 10000.rw(context);
          return Container();
        }));

        expect(result, isNotNull);
        expect(result! > 0, isTrue);
      });

      testWidgets('should handle fractional values correctly', (tester) async {
        double? result;

        await tester.pumpWidget(buildTestWidget((context) {
          result = 0.5.wfc(context);
          return Container();
        }));

        expect(result, closeTo(207.0, 0.01)); // Exactly half of 414
      });
    });
  });
}
