import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

import 'pages/pages.dart';

void main() {
  runApp(const MyApp());
}

/// The root application widget.
///
/// Configures the MaterialApp with UiH initialization, theme settings,
/// and sets [HomePage] as the initial route.
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
