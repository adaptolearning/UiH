import 'package:flutter/material.dart';

import 'device_detection_page.dart';
import 'extensions_showcase_page.dart';
import 'font_scaling_page.dart';
import 'responsive_sizing_page.dart';
import 'theme_integration_page.dart';

/// The main navigation shell that hosts all demo pages.
///
/// Provides a bottom navigation bar to switch between different feature
/// demonstrations of the UiH package.
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
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
