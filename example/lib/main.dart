import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

void main() => runApp(const MaterialApp(home: Demo()));

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.relativeScreenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What Platform Resolution are we currently in?:\n\n"
                  "Mobile   :${context.isMobile} \n\n"
                  "Tablet   :${context.isTablet} \n\n"
                  "Desktop :${context.isDesktop} \n\n\n\n"
                  "Is Screen in Landscape mode:\n"
                  "${context.isLandscape} \n\n"
                  "Device Size in pixel values:\n"
                  "${context.sizePx}\n\n"
                  "Device default Screen width size in pixels:\n"
                  "${context.widthPx}\n\n"
                  "Device default Screen height size in pixels:\n"
                  "${context.heightPx}\n\n"
                  "Device Screen diagonal size in pixels:\n"
                  "${context.diagonalPx}\n\n"
                  "Device default Screen width size:\n"
                  "${context.sizeInches}\n\n"
                  "Device Screen width inches:\n"
                  "${context.widthInches}\n\n"
                  "Device Screen height in inches:\n"
                  "${context.heightInches}\n\n"
                  "Device Screen diagonal size in inches:\n"
                  "${context.diagonalInches}\n\n"
                  "Converting width size from fraction in percentage:\n"
                  "${context.widthPct(.1)}\n\n"
                  "Converting height size from fraction in percentage:\n"
                  "${context.heightPct(.1)}\n\n"
                  "Device Screen size in Inches:\n"
                  "${context.sizeInches}\n\n"
                  "Default Padding form Media Query:\n"
                  "${context.mq.padding}\n\n"
                  "Relative Conversion to Screen Width from default size (${context.widthPx}):\n"
                  "${context.relativeScreenWidth(context.widthPx)}\n\n"
                  "Relative Conversion to Screen height from default size (${context.heightPx}):\n"
                  "${context.relativeScreenHeight(context.heightPx)}\n\n",
                ),
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
              style: Theme.of(context).textTheme.headline4,
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
