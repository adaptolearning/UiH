import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

import '../widgets/widgets.dart';

/// Demonstrates various extension methods provided by the UiH package.
///
/// Showcases string, double, int, and navigation/UI helper extensions
/// with practical examples and outputs.
class ExtensionsShowcasePage extends StatelessWidget {
  const ExtensionsShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Text(
          'Extension Methods',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        context.verticalSpacer(size: 16),

        // String Extensions
        DemoCard(
          title: 'String Extensions',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExtensionDemo(
                'isEmail()',
                'test@example.com'.isEmail().toString(),
              ),
              const ExtensionDemo('capitalize()', 'Hello world'),
              const ExtensionDemo('toCamelCase()', 'helloWorldExample'),
              const ExtensionDemo('reverse()', 'rettulF'),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Double Extensions
        DemoCard(
          title: 'Double Extensions',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExtensionDemo(
                '3.14159.roundToDecimalPlaces(2)',
                3.14159.roundToDecimalPlaces(2).toString(),
              ),
              ExtensionDemo('0.85.toPercentage()', 0.85.toPercentage()),
              ExtensionDemo('5.0.isInteger()', 5.0.isInteger().toString()),
              ExtensionDemo(
                '90.0.toRadians()',
                90.0.toRadians().toStringAsFixed(4),
              ),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Int Extensions
        DemoCard(
          title: 'Int Extensions',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('3.times((i) => print(i))'),
              const Text(
                'Output: 0, 1, 2',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 8.h),
              const Text('3.timesReverse((i) => print(i))'),
              const Text(
                'Output: 2, 1, 0',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Navigation & UI Helpers
        DemoCard(
          title: 'Navigation & UI Helpers',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.showSnackBar(
                    const SnackBar(
                      content: Text('Using context.showSnackBar()!'),
                    ),
                  );
                },
                child: const Text('Show SnackBar'),
              ),
              SizedBox(height: 8.h),
              const Text('Other helpers:'),
              const Text('• context.navigator'),
              const Text('• context.focusScope'),
              const Text('• context.scaffold'),
              const Text('• context.horizontalSpacer()'),
              const Text('• context.verticalSpacer()'),
            ],
          ),
        ),
      ],
    );
  }
}
