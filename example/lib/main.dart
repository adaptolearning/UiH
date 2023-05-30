import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

void main() => runApp(const MaterialApp(home: Demo()));

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
          "${context.sizePx}\n",
      "Device default Screen width size in pixels:\n\n"
          "${context.widthPx}\n",
      "Device default Screen height size in pixels:\n\n"
          "${context.heightPx}\n",
      "Device Screen diagonal size in pixels:\n\n"
          "${context.diagonalPx}\n",
      "Device default Screen width size:\n\n"
          "${context.sizeInches}\n",
      "Device Screen width inches:\n\n"
          "${context.widthInches}\n",
      "Device Screen height in inches:\n\n"
          "${context.heightInches}\n",
      "Device Screen diagonal size in inches:\n\n"
          "${context.diagonalInches}\n",
      "Converting width size from fraction in percentage:\n\n"
          "${context.widthPct(.1)}\n",
      "Converting height size from fraction in percentage:\n\n"
          "${context.heightPct(.1)}\n",
      "Device Screen size in Inches:\n\n"
          "${context.sizeInches}\n",
      "Default Padding form Media Query:\n\n"
          "${context.mq.padding}\n",
      "Relative Conversion to Screen Width from default size (${context.widthPx}):\n\n"
          "${context.relativeScreenWidth(context.widthPx)}\n",
      "Relative Conversion to Screen height from default size (${context.heightPx}):\n\n"
          "${context.relativeScreenHeight(context.heightPx)}\n",
      "Relative Conversion of Screen Font Size (12):\n\n"
          "${context.relativeFontSize(12)}\n",
      "Relative Conversion of Screen Font Size based on Break Point (12):\n\n"
          "${context.relativeFontSizeWithBreakPoint(12)}\n",
      "Theme based background color is : "
          "${context.backgroundColor.toString()}\n",
      "Theme based brightness color is : "
          "${context.brightness.toString()}\n",
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.relativeScreenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...data.map((e) => Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(20),
                      margin: EdgeInsets.only(
                          bottom: context.relativeScreenHeight(10)),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontSize: context.relativeFontSize(12),
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
                        child: context.verticalSpacer(multiplyBy: 1)),
                    const Text('Texting vertical spacer'),
                    Container(
                        padding: const EdgeInsets.all(2),
                        color: Colors.blue,
                        child: context.verticalSpacer(multiplyBy: 10)),
                  ],
                ),
                context.verticalSpacer(),
                Row(
                  children: [
                    Container(
                        padding: context.mq.padding,
                        color: Colors.red,
                        child: context.horizontalSpacer()),
                    const Text('Texting horizontal spacer'),
                    Container(
                        padding: context.mq.padding,
                        color: Colors.red,
                        child: context.horizontalSpacer(multiplyBy: 2)),
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
