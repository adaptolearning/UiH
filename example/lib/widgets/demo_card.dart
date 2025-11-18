import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

/// A card widget that displays demo content with a title and optional subtitle.
///
/// Used throughout the example app to showcase different UiH features with
/// consistent styling and layout. The card has rounded corners, elevation,
/// and responsive padding.
class DemoCard extends StatelessWidget {
  /// The main title displayed at the top of the card.
  final String title;

  /// Optional subtitle displayed below the title in a lighter color.
  final String? subtitle;

  /// The child widget to display as the card's content.
  final Widget child;

  const DemoCard({
    required this.title,
    this.subtitle,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
            ),
            if (subtitle != null) ...[
              SizedBox(height: 4.h),
              Text(
                subtitle!,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: context.colorScheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
            SizedBox(height: 12.h),
            child,
          ],
        ),
      ),
    );
  }
}
