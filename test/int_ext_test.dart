import 'package:flutter_test/flutter_test.dart';
import 'package:uih/src/int_ext.dart';

void main() {
  group('UihIntExtension', () {
    group('times', () {
      test('should call callback correct number of times', () {
        int count = 0;
        5.times((i) {
          count++;
        });
        expect(count, equals(5));
      });

      test('should pass correct index to callback', () {
        final indices = <int>[];
        5.times((i) {
          indices.add(i);
        });
        expect(indices, equals([0, 1, 2, 3, 4]));
      });

      test('should handle zero iterations', () {
        int count = 0;
        0.times((i) {
          count++;
        });
        expect(count, equals(0));
      });

      test('should handle single iteration', () {
        final indices = <int>[];
        1.times((i) {
          indices.add(i);
        });
        expect(indices, equals([0]));
      });

      test('should execute callback in order from 0 to n-1', () {
        final result = <int>[];
        10.times((i) {
          result.add(i);
        });
        expect(result, equals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]));
      });

      test('should work with large numbers', () {
        int count = 0;
        1000.times((i) {
          count++;
        });
        expect(count, equals(1000));
      });

      test('should allow callback to use index for calculations', () {
        int sum = 0;
        5.times((i) {
          sum += i;
        });
        expect(sum, equals(0 + 1 + 2 + 3 + 4)); // sum = 10
      });
    });

    group('timesReverse', () {
      test('should call callback correct number of times', () {
        int count = 0;
        5.timesReverse((i) {
          count++;
        });
        expect(count, equals(5));
      });

      test('should pass correct index to callback in reverse order', () {
        final indices = <int>[];
        5.timesReverse((i) {
          indices.add(i);
        });
        expect(indices, equals([4, 3, 2, 1, 0]));
      });

      test('should handle zero iterations', () {
        int count = 0;
        0.timesReverse((i) {
          count++;
        });
        expect(count, equals(0));
      });

      test('should handle single iteration', () {
        final indices = <int>[];
        1.timesReverse((i) {
          indices.add(i);
        });
        expect(indices, equals([0]));
      });

      test('should execute callback in reverse order from n-1 to 0', () {
        final result = <int>[];
        10.timesReverse((i) {
          result.add(i);
        });
        expect(result, equals([9, 8, 7, 6, 5, 4, 3, 2, 1, 0]));
      });

      test('should work with large numbers', () {
        int count = 0;
        1000.timesReverse((i) {
          count++;
        });
        expect(count, equals(1000));
      });

      test('should allow callback to use index for calculations', () {
        int sum = 0;
        5.timesReverse((i) {
          sum += i;
        });
        expect(sum, equals(4 + 3 + 2 + 1 + 0)); // sum = 10
      });

      test('should be reverse of times method', () {
        final forwardIndices = <int>[];
        final reverseIndices = <int>[];

        5.times((i) => forwardIndices.add(i));
        5.timesReverse((i) => reverseIndices.add(i));

        expect(reverseIndices, equals(forwardIndices.reversed.toList()));
      });
    });
  });
}
