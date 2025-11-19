import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

/// A widget that demonstrates an extension method with its result.
///
/// Shows the method call and its output in a formatted way, useful for
/// showcasing string, double, and other extension methods.
class ExtensionDemo extends StatelessWidget {
  /// The extension method call (e.g., "isEmail()").
  final String method;

  /// The result of calling the extension method.
  final String result;

  const ExtensionDemo(this.method, this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            method,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'monospace',
              color: context.colorScheme.primary,
            ),
          ),
          Text(
            '→ $result',
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
