import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // NEW: Wrap your app with UihInit for automatic initialization!
    // No need to call Uih.init(context) manually anymore!
    return UihInit(
      designSize: const Size(414, 896), // Optional - matches your design dimensions
      builder: (context) => const MaterialApp(
        title: 'UiH Demo',
        home: Demo(),
      ),
    );
  }
}

// Alternative approach using MaterialApp.builder:
// Uncomment this and comment out the above MyApp to try it
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UiH Demo',
      builder: Uih.builder(
        designSize: const Size(414, 896),
      ),
      home: const Demo(),
    );
  }
}
*/

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      "What Platform Resolution are we currently in?:\n\n"
          "Mobile   :${context.isMobile} \n"
          "Tablet   :${context.isTablet} \n"
          "Desktop :${context.isDesktop} \n",
      "Is Screen in Landscape mode:\n\n"
          "${context.isLandscape} \n",
      "Device Size in pixel values:\n\n"
          "${context.sizeInPixels}\n",
      "Device default Screen width size in pixels:\n\n"
          "${context.widthInPixels}\n",
      "Device default Screen height size in pixels:\n\n"
          "${context.heightInPixels}\n",
      "Device Screen diagonal size in pixels:\n\n"
          "${context.diagonalInPixels}\n",
      "Device default Screen width size:\n\n"
          "${context.sizeInInches}\n",
      "Device Screen width inches:\n\n"
          "${context.widthInInches}\n",
      "Device Screen height in inches:\n\n"
          "${context.heightInInches}\n",
      "Device Screen diagonal size in inches:\n\n"
          "${context.diagonalInInches}\n",
      "Converting width size from fraction:\n\n"
          "${context.widthFraction(.1)}\n",
      "Converting height size from fraction:\n\n"
          "${context.heightFraction(.1)}\n",
      "Device Screen size in Inches:\n\n"
          "${context.sizeInInches}\n",
      "Default Padding form Media Query:\n\n"
          "${context.mediaQuery.padding}\n",
      "Relative Conversion to Screen Width from default size (${context.widthInPixels}):\n\n"
          "${context.relativeWidth(context.widthInPixels)}\n",
      "Relative Conversion to Screen height from default size (${context.heightInPixels}):\n\n"
          "${context.relativeHeight(context.heightInPixels)}\n",
      "Scaled Font Size (12):\n\n"
          "${context.scaledFontSize(12)}\n",
      "Adaptive Font Size based on Breakpoint (12):\n\n"
          "${context.adaptiveFontSize(12)}\n",
      "Theme based background color is : "
          "${context.backgroundColor.toString()}\n",
      "Theme based brightness color is : "
          "${context.brightness.toString()}\n",
      // NEW: Numeric Extension Examples
      "=== NUMERIC EXTENSIONS DEMO ===\n",
      "100.rw(context) = Relative Width:\n\n"
          "${100.rw(context)}\n",
      "100.rw(context) = Same as .rw() (alias):\n\n"
          "${100.rw(context)}\n",
      "50.rh(context) = Relative Height:\n\n"
          "${50.rh(context)}\n",
      "50.rh(context) = Same as .rh() (alias):\n\n"
          "${50.rh(context)}\n",
      "16.sf(context) = Scaled Font:\n\n"
          "${16.sf(context)}\n",
      "16.sf(context) = Same as .sf() (scaled pixel):\n\n"
          "${16.sf(context)}\n",
      "16.afc(context) = Adaptive Font:\n\n"
          "${16.afc(context)}\n",
      "0.5.wfc(context) = 50% Screen Width:\n\n"
          "${0.5.wfc(context)}\n",
      "0.3.hfc(context) = 30% Screen Height:\n\n"
          "${0.3.hfc(context)}\n",
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            // NEW: Context-free API (no context needed!)
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NEW: Initialization Approach Showcase
                Container(
                  width: 0.95.wf,
                  padding: EdgeInsets.all(20.w),
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green.shade600, Colors.teal.shade600],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.white, size: 28),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              'No Manual Init Required!',
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'This app uses UihInit - automatic initialization with no manual Uih.init() calls needed!',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Before (Tedious):',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.red.shade200,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Uih.init(context); // Every screen!',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.white70,
                                fontFamily: 'monospace',
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'After (Clean):',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.green.shade200,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'UihInit(builder: (ctx) => MaterialApp(...))',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.white,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Hero section: Context-Free API Demo
                Container(
                  width: 0.95.wf, // Context-free!
                  padding: EdgeInsets.all(20.w),
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple.shade700, Colors.blue.shade700],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Context-Free API!',
                        style: TextStyle(
                          fontSize: 24.sp, // No context needed!
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'After calling Uih.init(context), you can use numeric extensions without context:',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '100.w    // Width (no context!)',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.white,
                                fontFamily: 'monospace',
                              ),
                            ),
                            Text(
                              '50.h     // Height',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.white,
                                fontFamily: 'monospace',
                              ),
                            ),
                            Text(
                              '14.sp    // Scaled pixel',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.white,
                                fontFamily: 'monospace',
                              ),
                            ),
                            Text(
                              '0.5.wf   // 50% width',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.white,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Comparison: Context-Free vs Context-Based
                Container(
                  width: 0.95.wf,
                  padding: EdgeInsets.all(16.w),
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green.shade300, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'API Comparison',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // Context-Free
                      Text(
                        'NEW: Context-Free',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Container(width: 100.w, height: 50.h)',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'monospace',
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // Context-Based
                      Text(
                        'OLD: Context-Based (still works)',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade700,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Container(width: 100.rw(context), height: 50.rh(context))',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'monospace',
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                // Visual Demo: Both APIs produce same result
                Container(
                  width: 0.95.wf,
                  padding: EdgeInsets.all(16.w),
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Visual Proof: Both APIs Work',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // Context-free example
                      Row(
                        children: [
                          Container(
                            width: 100.w, // Context-free!
                            height: 50.h,
                            color: Colors.purple.shade300,
                            child: Center(
                              child: Text(
                                '100.w\n50.h',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 11.sp, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Text(
                              'Context-free: 100.w, 50.h',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),

                      // Context-based example (same result)
                      Row(
                        children: [
                          Container(
                            width: 100.rw(context), // Context-based
                            height: 50.rh(context),
                            color: Colors.orange.shade300,
                            child: Center(
                              child: Text(
                                '100.w(ctx)\n50.h(ctx)',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 11.sf(context), color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Text(
                              'Context-based: 100.rw(context), 50.rh(context)',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ...data.map((e) => Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // DEMO: Using numeric extension instead of EdgeInsets.all(20)
                      padding: EdgeInsets.all(20.rw(context)),
                      // DEMO: Using numeric extension instead of context.relativeHeight(10)
                      margin: EdgeInsets.only(bottom: 10.rh(context)),
                      child: Text(
                        e,
                        style: TextStyle(
                          // DEMO: Using .sp() instead of context.scaledFontSize(12)
                          fontSize: 12.sf(context),
                        ),
                      ),
                    )),
                // Text(
                //   "What Platform Resolution are we currently in?:\n\n"
                //   "Mobile   :${context.isMobile} \n"
                //   "Tablet   :${context.isTablet} \n"
                //   "Desktop :${context.isDesktop} \n\n"
                //   "Is Screen in Landscape mode:\n\n"
                //   "${context.isLandscape} \n"
                //   "Device Size in pixel values:\n\n"
                //   "${context.sizePx}\n"
                //   "Device default Screen width size in pixels:\n\n"
                //   "${context.widthPx}\n"
                //   "Device default Screen height size in pixels:\n\n"
                //   "${context.heightPx}\n"
                //   "Device Screen diagonal size in pixels:\n\n"
                //   "${context.diagonalPx}\n"
                //   "Device default Screen width size:\n\n"
                //   "${context.sizeInches}\n"
                //   "Device Screen width inches:\n\n"
                //   "${context.widthInches}\n"
                //   "Device Screen height in inches:\n\n"
                //   "${context.heightInches}\n"
                //   "Device Screen diagonal size in inches:\n\n"
                //   "${context.diagonalInches}\n"
                //   "Converting width size from fraction in percentage:\n\n"
                //   "${context.widthPct(.1)}\n"
                //   "Converting height size from fraction in percentage:\n\n"
                //   "${context.heightPct(.1)}\n"
                //   "Device Screen size in Inches:\n\n"
                //   "${context.sizeInches}\n"
                //   "Default Padding form Media Query:\n\n"
                //   "${context.mq.padding}\n"
                //   "Relative Conversion to Screen Width from default size (${context.widthPx}):\n\n"
                //   "${context.relativeScreenWidth(context.widthPx)}\n"
                //   "Relative Conversion to Screen height from default size (${context.heightPx}):\n\n"
                //   "${context.relativeScreenHeight(context.heightPx)}\n"
                //   "Relative Conversion of Screen Font Size (12):\n\n"
                //   "${context.relativeFontSize(12)}\n"
                //   "Relative Conversion of Screen Font Size based on Break Point (12):\n\n"
                //   "${context.relativeFontSizeWithBreakPoint(12)}\n"
                //   "Theme based background color is : "
                //   "${context.backgroundColor.toString()}\n"
                //   "Theme based brightness color is : "
                //   "${context.brightness.toString()}\n",
                //   style: TextStyle(
                //     fontSize: context.relativeFontSize(12),
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(2),
                        color: Colors.blue,
                        child: context.verticalSpacer(multiplier: 1)),
                    const Text('Texting vertical spacer'),
                    Container(
                        padding: const EdgeInsets.all(2),
                        color: Colors.blue,
                        child: context.verticalSpacer(multiplier: 10)),
                  ],
                ),
                context.verticalSpacer(),
                Row(
                  children: [
                    Container(
                        padding: context.mediaQuery.padding,
                        color: Colors.red,
                        child: context.horizontalSpacer()),
                    const Text('Texting horizontal spacer'),
                    Container(
                        padding: context.mediaQuery.padding,
                        color: Colors.red,
                        child: context.horizontalSpacer(multiplier: 2)),
                    const Text('Texting horizontal spacer'),
                  ],
                ),
                TextButton.icon(
                    onPressed: () {
                      context.showSnackBar(const SnackBar(
                          content: Text('Snackbar example!'),
                          duration: Duration(seconds: 5)));
                    },
                    icon: const Icon(
                      Icons.podcasts,
                    ),
                    label: const Text('Snackbar in context')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
