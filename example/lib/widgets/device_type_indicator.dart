import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

/// An indicator widget that shows a device type or orientation status.
///
/// Displays a label with a description and provides visual feedback
/// (highlighted styling and check icon) when the condition is active.
class DeviceTypeIndicator extends StatelessWidget {
  /// The main label text (e.g., "Mobile", "Tablet", "Landscape").
  final String label;

  /// Whether this device type/orientation is currently active.
  final bool isActive;

  /// A description explaining the condition (e.g., "< 600dp").
  final String description;

  const DeviceTypeIndicator({
    required this.label,
    required this.isActive,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isActive
            ? context.colorScheme.primaryContainer
            : context.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isActive ? context.colorScheme.primary : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isActive ? Icons.check_circle : Icons.circle_outlined,
            color: isActive
                ? context.colorScheme.primary
                : context.colorScheme.onSurfaceVariant,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
