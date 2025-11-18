import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap app with UihInit for context-free API support
    return UihInit(
      designSize: const Size(414, 896), // iPhone 11 Pro Max design size
      builder: (context) => MaterialApp(
        title: 'UiH Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    ResponsiveSizingPage(),
    FontScalingPage(),
    DeviceDetectionPage(),
    ThemeIntegrationPage(),
    ExtensionsShowcasePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UiH Package Demo'),
        backgroundColor: context.colorScheme.primaryContainer,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.photo_size_select_small),
            label: 'Sizing',
          ),
          NavigationDestination(icon: Icon(Icons.text_fields), label: 'Fonts'),
          NavigationDestination(icon: Icon(Icons.devices), label: 'Device'),
          NavigationDestination(icon: Icon(Icons.palette), label: 'Theme'),
          NavigationDestination(
            icon: Icon(Icons.extension),
            label: 'Extensions',
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Page 1: Responsive Sizing Demo
// ============================================================================
class ResponsiveSizingPage extends StatelessWidget {
  const ResponsiveSizingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Text(
          'Responsive Sizing',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        context.verticalSpacer(size: 16),

        // Relative Width Example
        _DemoCard(
          title: 'Relative Width (.w)',
          child: Column(
            children: [
              _SizeBox(width: 100.w, label: '100.w'),
              SizedBox(height: 8.h),
              _SizeBox(width: 200.w, label: '200.w'),
              SizedBox(height: 8.h),
              _SizeBox(width: 300.w, label: '300.w'),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Relative Height Example
        _DemoCard(
          title: 'Relative Height (.h)',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _SizeBox(height: 50.h, label: '50.h'),
              _SizeBox(height: 100.h, label: '100.h'),
              _SizeBox(height: 150.h, label: '150.h'),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Width Fraction Example
        _DemoCard(
          title: 'Width Fraction (.wf)',
          child: Column(
            children: [
              _SizeBox(width: 0.5.wf, label: '50% width'),
              SizedBox(height: 8.h),
              _SizeBox(width: 0.75.wf, label: '75% width'),
              SizedBox(height: 8.h),
              _SizeBox(width: 0.9.wf, label: '90% width'),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Screen Dimensions Info
        _DemoCard(
          title: 'Screen Dimensions',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoRow(
                'Width (pixels)',
                context.widthInPixels.toStringAsFixed(0),
              ),
              _InfoRow(
                'Height (pixels)',
                context.heightInPixels.toStringAsFixed(0),
              ),
              _InfoRow(
                'Diagonal (pixels)',
                context.diagonalInPixels.toStringAsFixed(0),
              ),
              _InfoRow(
                'Width (inches)',
                '${context.widthInInches.toStringAsFixed(2)}"',
              ),
              _InfoRow(
                'Height (inches)',
                '${context.heightInInches.toStringAsFixed(2)}"',
              ),
              _InfoRow(
                'Diagonal (inches)',
                '${context.diagonalInInches.toStringAsFixed(2)}"',
              ),
              _InfoRow('PPI', context.pixelsPerInch.toStringAsFixed(0)),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// Page 2: Font Scaling Demo
// ============================================================================
class FontScalingPage extends StatelessWidget {
  const FontScalingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Text(
          'Font Scaling',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        context.verticalSpacer(size: 16),

        // Scaled Font (.sp)
        _DemoCard(
          title: 'Scaled Font (.sp) - Diagonal-based',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('12.sp font size', style: TextStyle(fontSize: 12.sp)),
              SizedBox(height: 8.h),
              Text('14.sp font size', style: TextStyle(fontSize: 14.sp)),
              SizedBox(height: 8.h),
              Text('16.sp font size', style: TextStyle(fontSize: 16.sp)),
              SizedBox(height: 8.h),
              Text('18.sp font size', style: TextStyle(fontSize: 18.sp)),
              SizedBox(height: 8.h),
              Text('20.sp font size', style: TextStyle(fontSize: 20.sp)),
              SizedBox(height: 8.h),
              Text('24.sp font size', style: TextStyle(fontSize: 24.sp)),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Adaptive Font (.af)
        _DemoCard(
          title: 'Adaptive Font (.af) - Breakpoint-based',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('12.af font size', style: TextStyle(fontSize: 12.af)),
              SizedBox(height: 8.h),
              Text('14.af font size', style: TextStyle(fontSize: 14.af)),
              SizedBox(height: 8.h),
              Text('16.af font size', style: TextStyle(fontSize: 16.af)),
              SizedBox(height: 8.h),
              Text('18.af font size', style: TextStyle(fontSize: 18.af)),
              SizedBox(height: 8.h),
              Text('20.af font size', style: TextStyle(fontSize: 20.af)),
              SizedBox(height: 8.h),
              Text('24.af font size', style: TextStyle(fontSize: 24.af)),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Comparison
        _DemoCard(
          title: 'Comparison: .sp vs .af',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Size', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('.sp', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('.af', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const Divider(),
              _FontComparisonRow(16),
              _FontComparisonRow(18),
              _FontComparisonRow(20),
              _FontComparisonRow(24),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// Page 3: Device Detection Demo
// ============================================================================
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
        _DemoCard(
          title: 'Material Design 3 Breakpoints',
          child: Column(
            children: [
              _DeviceTypeIndicator(
                label: 'Mobile',
                isActive: context.isMobile,
                description: '< 600dp',
              ),
              SizedBox(height: 12.h),
              _DeviceTypeIndicator(
                label: 'Tablet',
                isActive: context.isTablet,
                description: '600-840dp',
              ),
              SizedBox(height: 12.h),
              _DeviceTypeIndicator(
                label: 'Desktop',
                isActive: context.isDesktop,
                description: '≥ 840dp',
              ),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Orientation
        _DemoCard(
          title: 'Orientation',
          child: _DeviceTypeIndicator(
            label: context.isLandscape ? 'Landscape' : 'Portrait',
            isActive: true,
            description: context.isLandscape
                ? 'Width > Height'
                : 'Height > Width',
          ),
        ),

        context.verticalSpacer(size: 16),

        // Adaptive Layout Example
        _DemoCard(
          title: 'Adaptive Layout Example',
          child: context.isMobile
              ? Column(
                  children: [
                    _AdaptiveBox('Mobile', Colors.orange),
                    SizedBox(height: 8.h),
                    _AdaptiveBox('Layout', Colors.orange),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _AdaptiveBox('Tablet/Desktop', Colors.green),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(child: _AdaptiveBox('Layout', Colors.green)),
                  ],
                ),
        ),
      ],
    );
  }
}

// ============================================================================
// Page 4: Theme Integration Demo
// ============================================================================
class ThemeIntegrationPage extends StatelessWidget {
  const ThemeIntegrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Text(
          'Theme Integration',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        context.verticalSpacer(size: 16),

        // Color Scheme
        _DemoCard(
          title: 'Color Scheme (context.colorScheme)',
          child: Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              _ColorChip('Primary', context.colorScheme.primary),
              _ColorChip('Secondary', context.colorScheme.secondary),
              _ColorChip('Tertiary', context.colorScheme.tertiary),
              _ColorChip('Error', context.colorScheme.error),
              _ColorChip('Surface', context.colorScheme.surface),
              _ColorChip('Background', context.backgroundColor),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Text Theme
        _DemoCard(
          title: 'Text Theme (context.textTheme)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Display Large', style: context.textTheme.displayLarge),
              SizedBox(height: 8.h),
              Text('Headline Large', style: context.textTheme.headlineLarge),
              SizedBox(height: 8.h),
              Text('Title Large', style: context.textTheme.titleLarge),
              SizedBox(height: 8.h),
              Text('Body Large', style: context.textTheme.bodyLarge),
              SizedBox(height: 8.h),
              Text('Body Medium', style: context.textTheme.bodyMedium),
              SizedBox(height: 8.h),
              Text('Label Small', style: context.textTheme.labelSmall),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Theme Info
        _DemoCard(
          title: 'Theme Properties',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoRow(
                'Brightness',
                context.brightness.toString().split('.').last,
              ),
              _InfoRow(
                'Platform',
                context.theme.platform.toString().split('.').last,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// Page 5: Extensions Showcase
// ============================================================================
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
        _DemoCard(
          title: 'String Extensions',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ExtensionDemo(
                'isEmail()',
                'test@example.com'.isEmail().toString(),
              ),
              _ExtensionDemo('capitalize()', 'hello world'.capitalize()),
              _ExtensionDemo(
                'toCamelCase()',
                'hello world example'.toCamelCase(),
              ),
              _ExtensionDemo('reverse()', 'Flutter'.reverse()),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Double Extensions
        _DemoCard(
          title: 'Double Extensions',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ExtensionDemo(
                '3.14159.roundToDecimalPlaces(2)',
                3.14159.roundToDecimalPlaces(2).toString(),
              ),
              _ExtensionDemo('0.85.toPercentage()', 0.85.toPercentage()),
              _ExtensionDemo('5.0.isInteger()', 5.0.isInteger().toString()),
              _ExtensionDemo(
                '90.0.toRadians()',
                90.0.toRadians().toStringAsFixed(4),
              ),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Int Extensions
        _DemoCard(
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
        _DemoCard(
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

// ============================================================================
// Helper Widgets
// ============================================================================

class _DemoCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _DemoCard({required this.title, required this.child});

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
            SizedBox(height: 12.h),
            child,
          ],
        ),
      ),
    );
  }
}

class _SizeBox extends StatelessWidget {
  final double? width;
  final double? height;
  final String label;

  const _SizeBox({this.width, this.height, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 40.h,
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14.sp)),
          Text(
            value,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _FontComparisonRow extends StatelessWidget {
  final int size;

  const _FontComparisonRow(this.size);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$size', style: TextStyle(fontSize: 14.sp)),
          Text(
            size.toDouble().sp.toStringAsFixed(1),
            style: TextStyle(fontSize: 14.sp),
          ),
          Text(
            size.toDouble().af.toStringAsFixed(1),
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

class _DeviceTypeIndicator extends StatelessWidget {
  final String label;
  final bool isActive;
  final String description;

  const _DeviceTypeIndicator({
    required this.label,
    required this.isActive,
    required this.description,
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

class _AdaptiveBox extends StatelessWidget {
  final String text;
  final Color color;

  const _AdaptiveBox(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}

class _ColorChip extends StatelessWidget {
  final String label;
  final Color color;

  const _ColorChip(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(backgroundColor: color),
      label: Text(label),
    );
  }
}

class _ExtensionDemo extends StatelessWidget {
  final String method;
  final String result;

  const _ExtensionDemo(this.method, this.result);

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
