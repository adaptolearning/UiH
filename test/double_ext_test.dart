import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:uih/src/double_ext.dart';

void main() {
  group('UihDoubleExtension', () {
    group('roundToDecimalPlaces', () {
      test('should round to 0 decimal places', () {
        expect(3.14159.roundToDecimalPlaces(0), equals(3.0));
        expect(3.6.roundToDecimalPlaces(0), equals(4.0));
        expect(3.5.roundToDecimalPlaces(0), equals(4.0));
      });

      test('should round to 1 decimal place', () {
        expect(3.14159.roundToDecimalPlaces(1), equals(3.1));
        expect(3.16.roundToDecimalPlaces(1), equals(3.2));
        expect(3.15.roundToDecimalPlaces(1), equals(3.2));
      });

      test('should round to 2 decimal places', () {
        expect(3.14159.roundToDecimalPlaces(2), equals(3.14));
        expect(3.146.roundToDecimalPlaces(2), equals(3.15));
        expect(2.345.roundToDecimalPlaces(2), equals(2.35));
      });

      test('should round to 3 decimal places', () {
        expect(3.14159.roundToDecimalPlaces(3), equals(3.142));
        expect(3.1415.roundToDecimalPlaces(3), equals(3.142));
      });

      test('should handle negative numbers', () {
        expect((-3.14159).roundToDecimalPlaces(2), equals(-3.14));
        expect((-3.146).roundToDecimalPlaces(2), equals(-3.15));
      });

      test('should handle zero', () {
        expect(0.0.roundToDecimalPlaces(2), equals(0.0));
      });

      test('should handle numbers already at desired precision', () {
        expect(3.14.roundToDecimalPlaces(2), equals(3.14));
        expect(5.0.roundToDecimalPlaces(2), equals(5.0));
      });
    });

    group('toPercentage', () {
      test('should convert decimal to percentage string', () {
        expect(0.5.toPercentage(), equals('50.00%'));
        expect(0.75.toPercentage(), equals('75.00%'));
        expect(1.0.toPercentage(), equals('100.00%'));
      });

      test('should format to 2 decimal places', () {
        expect(0.12345.toPercentage(), equals('12.35%'));
        expect(0.666.toPercentage(), equals('66.60%'));
      });

      test('should handle zero', () {
        expect(0.0.toPercentage(), equals('0.00%'));
      });

      test('should handle values greater than 1', () {
        expect(1.5.toPercentage(), equals('150.00%'));
        expect(2.0.toPercentage(), equals('200.00%'));
      });

      test('should handle negative values', () {
        expect((-0.25).toPercentage(), equals('-25.00%'));
      });

      test('should handle very small values', () {
        expect(0.001.toPercentage(), equals('0.10%'));
      });
    });

    group('isInteger', () {
      test('should return true for integer values', () {
        expect(1.0.isInteger(), isTrue);
        expect(42.0.isInteger(), isTrue);
        expect((-5.0).isInteger(), isTrue);
        expect(0.0.isInteger(), isTrue);
      });

      test('should return false for non-integer values', () {
        expect(1.5.isInteger(), isFalse);
        expect(3.14.isInteger(), isFalse);
        expect(0.1.isInteger(), isFalse);
        expect((-2.7).isInteger(), isFalse);
      });

      test('should return true for very large integers', () {
        expect(1000000.0.isInteger(), isTrue);
      });

      test('should handle edge cases near integers', () {
        expect(1.0000000001.isInteger(), isFalse);
        expect(0.9999999999.isInteger(), isFalse);
      });
    });

    group('toRadians', () {
      test('should convert degrees to radians', () {
        expect(0.0.toRadians(), equals(0.0));
        expect(180.0.toRadians(), closeTo(pi, 0.000001));
        expect(360.0.toRadians(), closeTo(2 * pi, 0.000001));
        expect(90.0.toRadians(), closeTo(pi / 2, 0.000001));
      });

      test('should handle negative degrees', () {
        expect((-90.0).toRadians(), closeTo(-pi / 2, 0.000001));
        expect((-180.0).toRadians(), closeTo(-pi, 0.000001));
      });

      test('should convert common angles correctly', () {
        expect(45.0.toRadians(), closeTo(pi / 4, 0.000001));
        expect(30.0.toRadians(), closeTo(pi / 6, 0.000001));
        expect(60.0.toRadians(), closeTo(pi / 3, 0.000001));
      });

      test('should handle values greater than 360', () {
        expect(720.0.toRadians(), closeTo(4 * pi, 0.000001));
      });
    });

    group('toDegrees', () {
      test('should convert radians to degrees', () {
        expect(0.0.toDegrees(), equals(0.0));
        expect(pi.toDegrees(), closeTo(180.0, 0.000001));
        expect((2 * pi).toDegrees(), closeTo(360.0, 0.000001));
        expect((pi / 2).toDegrees(), closeTo(90.0, 0.000001));
      });

      test('should handle negative radians', () {
        expect((-pi / 2).toDegrees(), closeTo(-90.0, 0.000001));
        expect((-pi).toDegrees(), closeTo(-180.0, 0.000001));
      });

      test('should convert common angles correctly', () {
        expect((pi / 4).toDegrees(), closeTo(45.0, 0.000001));
        expect((pi / 6).toDegrees(), closeTo(30.0, 0.000001));
        expect((pi / 3).toDegrees(), closeTo(60.0, 0.000001));
      });

      test('should be inverse of toRadians', () {
        const testDegrees = 45.0;
        expect(testDegrees.toRadians().toDegrees(), closeTo(testDegrees, 0.000001));
      });
    });

    group('formatDecimalPlaces', () {
      test('should format to specified decimal places', () {
        expect(3.14159.formatDecimalPlaces(2), equals('3.14'));
        expect(3.14159.formatDecimalPlaces(3), equals('3.142'));
        expect(3.14159.formatDecimalPlaces(0), equals('3'));
      });

      test('should pad with zeros if needed', () {
        expect(3.1.formatDecimalPlaces(2), equals('3.10'));
        expect(5.0.formatDecimalPlaces(3), equals('5.000'));
      });

      test('should handle zero', () {
        expect(0.0.formatDecimalPlaces(2), equals('0.00'));
      });

      test('should handle negative numbers', () {
        expect((-3.14159).formatDecimalPlaces(2), equals('-3.14'));
      });

      test('should handle integers', () {
        expect(42.0.formatDecimalPlaces(2), equals('42.00'));
      });

      test('should round when necessary', () {
        expect(3.145.formatDecimalPlaces(2), equals('3.15'));
        expect(3.144.formatDecimalPlaces(2), equals('3.14'));
      });
    });
  });
}
