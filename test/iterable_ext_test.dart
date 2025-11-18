import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uih/src/iterable_ext.dart';

void main() {
  group('UihWidgetStateExtension', () {
    group('isHovered', () {
      test('should return true when hovered state is present', () {
        final states = <WidgetState>{WidgetState.hovered};
        expect(states.isHovered, isTrue);
      });

      test('should return false when hovered state is absent', () {
        final states = <WidgetState>{WidgetState.focused};
        expect(states.isHovered, isFalse);
      });

      test('should work with multiple states including hovered', () {
        final states = <WidgetState>{
          WidgetState.hovered,
          WidgetState.focused,
          WidgetState.pressed
        };
        expect(states.isHovered, isTrue);
      });

      test('should return false for empty set', () {
        final states = <WidgetState>{};
        expect(states.isHovered, isFalse);
      });
    });

    group('isFocused', () {
      test('should return true when focused state is present', () {
        final states = <WidgetState>{WidgetState.focused};
        expect(states.isFocused, isTrue);
      });

      test('should return false when focused state is absent', () {
        final states = <WidgetState>{WidgetState.hovered};
        expect(states.isFocused, isFalse);
      });

      test('should work with multiple states including focused', () {
        final states = <WidgetState>{
          WidgetState.focused,
          WidgetState.pressed
        };
        expect(states.isFocused, isTrue);
      });
    });

    group('isPressed', () {
      test('should return true when pressed state is present', () {
        final states = <WidgetState>{WidgetState.pressed};
        expect(states.isPressed, isTrue);
      });

      test('should return false when pressed state is absent', () {
        final states = <WidgetState>{WidgetState.hovered};
        expect(states.isPressed, isFalse);
      });

      test('should work with multiple states including pressed', () {
        final states = <WidgetState>{
          WidgetState.hovered,
          WidgetState.pressed,
          WidgetState.focused
        };
        expect(states.isPressed, isTrue);
      });
    });

    group('isDragged', () {
      test('should return true when dragged state is present', () {
        final states = <WidgetState>{WidgetState.dragged};
        expect(states.isDragged, isTrue);
      });

      test('should return false when dragged state is absent', () {
        final states = <WidgetState>{WidgetState.hovered};
        expect(states.isDragged, isFalse);
      });
    });

    group('isSelected', () {
      test('should return true when selected state is present', () {
        final states = <WidgetState>{WidgetState.selected};
        expect(states.isSelected, isTrue);
      });

      test('should return false when selected state is absent', () {
        final states = <WidgetState>{WidgetState.hovered};
        expect(states.isSelected, isFalse);
      });

      test('should work with multiple states including selected', () {
        final states = <WidgetState>{
          WidgetState.selected,
          WidgetState.hovered
        };
        expect(states.isSelected, isTrue);
      });
    });

    group('isScrolledUnder', () {
      test('should return true when scrolledUnder state is present', () {
        final states = <WidgetState>{WidgetState.scrolledUnder};
        expect(states.isScrolledUnder, isTrue);
      });

      test('should return false when scrolledUnder state is absent', () {
        final states = <WidgetState>{WidgetState.hovered};
        expect(states.isScrolledUnder, isFalse);
      });
    });

    group('isDisabled', () {
      test('should return true when disabled state is present', () {
        final states = <WidgetState>{WidgetState.disabled};
        expect(states.isDisabled, isTrue);
      });

      test('should return false when disabled state is absent', () {
        final states = <WidgetState>{WidgetState.hovered};
        expect(states.isDisabled, isFalse);
      });

      test('should work with multiple states including disabled', () {
        final states = <WidgetState>{
          WidgetState.disabled,
          WidgetState.focused
        };
        expect(states.isDisabled, isTrue);
      });
    });

    group('isError', () {
      test('should return true when error state is present', () {
        final states = <WidgetState>{WidgetState.error};
        expect(states.isError, isTrue);
      });

      test('should return false when error state is absent', () {
        final states = <WidgetState>{WidgetState.hovered};
        expect(states.isError, isFalse);
      });

      test('should work with multiple states including error', () {
        final states = <WidgetState>{
          WidgetState.error,
          WidgetState.focused,
          WidgetState.disabled
        };
        expect(states.isError, isTrue);
      });
    });

    group('multiple states combinations', () {
      test('should handle all states being present', () {
        final states = <WidgetState>{
          WidgetState.hovered,
          WidgetState.focused,
          WidgetState.pressed,
          WidgetState.dragged,
          WidgetState.selected,
          WidgetState.scrolledUnder,
          WidgetState.disabled,
          WidgetState.error,
        };

        expect(states.isHovered, isTrue);
        expect(states.isFocused, isTrue);
        expect(states.isPressed, isTrue);
        expect(states.isDragged, isTrue);
        expect(states.isSelected, isTrue);
        expect(states.isScrolledUnder, isTrue);
        expect(states.isDisabled, isTrue);
        expect(states.isError, isTrue);
      });

      test('should handle empty state set', () {
        final states = <WidgetState>{};

        expect(states.isHovered, isFalse);
        expect(states.isFocused, isFalse);
        expect(states.isPressed, isFalse);
        expect(states.isDragged, isFalse);
        expect(states.isSelected, isFalse);
        expect(states.isScrolledUnder, isFalse);
        expect(states.isDisabled, isFalse);
        expect(states.isError, isFalse);
      });
    });
  });

  group('UihIterableExtension', () {
    group('containsAny', () {
      test('should return true when any element is present', () {
        final list = [1, 2, 3, 4, 5];
        expect(list.containsAny([3]), isTrue);
        expect(list.containsAny([6, 7, 3]), isTrue);
      });

      test('should return false when no elements are present', () {
        final list = [1, 2, 3, 4, 5];
        expect(list.containsAny([6, 7, 8]), isFalse);
      });

      test('should return true when multiple elements are present', () {
        final list = [1, 2, 3, 4, 5];
        expect(list.containsAny([2, 3, 4]), isTrue);
      });

      test('should return false for empty other iterable', () {
        final list = [1, 2, 3];
        expect(list.containsAny([]), isFalse);
      });

      test('should return false when checking empty list', () {
        final list = <int>[];
        expect(list.containsAny([1, 2, 3]), isFalse);
      });

      test('should work with strings', () {
        final list = ['apple', 'banana', 'cherry'];
        expect(list.containsAny(['banana', 'grape']), isTrue);
        expect(list.containsAny(['grape', 'melon']), isFalse);
      });

      test('should work with sets', () {
        final set = {1, 2, 3, 4, 5};
        expect(set.containsAny([3, 6]), isTrue);
        expect(set.containsAny([6, 7]), isFalse);
      });

      test('should handle null values', () {
        final list = [1, null, 3];
        expect(list.containsAny([null]), isTrue);
        expect(list.containsAny([2, null]), isTrue);
      });

      test('should work with mixed types', () {
        final list = [1, 'hello', 3.14, true];
        expect(list.containsAny(['hello', false]), isTrue);
        expect(list.containsAny([3.14, 'world']), isTrue);
        expect(list.containsAny(['world', false]), isFalse);
      });

      test('should return true if first element matches', () {
        final list = [1, 2, 3];
        expect(list.containsAny([1, 4, 5]), isTrue);
      });

      test('should return true if last element matches', () {
        final list = [1, 2, 3];
        expect(list.containsAny([4, 5, 3]), isTrue);
      });

      test('should work with single element iterables', () {
        final list = [1];
        expect(list.containsAny([1]), isTrue);
        expect(list.containsAny([2]), isFalse);
      });

      test('should be order independent', () {
        final list = [1, 2, 3, 4, 5];
        expect(list.containsAny([5, 4, 3, 2, 1]), isTrue);
        expect(list.containsAny([3, 1, 5]), isTrue);
      });
    });
  });
}
