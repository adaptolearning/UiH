import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

import '../widgets/widgets.dart';

/// Demonstrates device detection and adaptive layout features.
///
/// Shows Material Design 3 breakpoint detection (mobile, tablet, desktop),
/// orientation detection, and example adaptive layouts.
class DeviceDetectionPage extends StatelessWidget {
  const DeviceDetectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Text(
          'Device Detection',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        context.verticalSpacer(size: 16),

        // Device Type Detection
        DemoCard(
          title: 'Material Design 3 Breakpoints',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeviceTypeIndicator(
                label: 'Mobile',
                isActive: context.isMobile,
                description: '< 600dp',
              ),
              SizedBox(height: 12.h),
              DeviceTypeIndicator(
                label: 'Tablet',
                isActive: context.isTablet,
                description: '600-840dp',
              ),
              SizedBox(height: 12.h),
              DeviceTypeIndicator(
                label: 'Desktop',
                isActive: context.isDesktop,
                description: '≥ 840dp',
              ),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Orientation
        DemoCard(
          title: 'Orientation',
          child: DeviceTypeIndicator(
            label: context.isLandscape ? 'Landscape' : 'Portrait',
            isActive: true,
            description: context.isLandscape
                ? 'Width > Height'
                : 'Height > Width',
          ),
        ),

        context.verticalSpacer(size: 16),

        // Adaptive Layout Example
        DemoCard(
          title: 'Adaptive Layout Example',
          child: context.isMobile
              ? Column(
                  children: [
                    AdaptiveBox('Mobile', context.colorScheme.secondary),
                    SizedBox(height: 8.h),
                    AdaptiveBox('Layout', context.colorScheme.secondary),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: AdaptiveBox(
                        'Tablet/Desktop',
                        context.colorScheme.tertiary,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: AdaptiveBox(
                        'Layout',
                        context.colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
