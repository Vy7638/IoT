import 'package:flutter/material.dart';

const List<Widget> comu = <Widget>[
  Icon(Icons.message),
  Icon(Icons.call),
  Icon(Icons.flip_camera_android_sharp),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My application IoT'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<bool> _selectedComu = <bool>[true, false, false];
  // final List<bool> _selectedVegetables = <bool>[false, true, false];
  // final List<bool> _selectedWeather = <bool>[false, false, true];
  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title)
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ToggleButtons with a single selection.
              // Text('Single-select', style: theme.textTheme.titleSmall),
              // const SizedBox(height: 5),
              // ToggleButtons(
              //   direction: vertical ? Axis.vertical : Axis.horizontal,
              //   onPressed: (int index) {
              //     setState(() {
              //       // The button that is tapped is set to true, and the others to false.
              //       for (int i = 0; i < _selectedComu.length; i++) {
              //         _selectedComu[i] = i == index;
              //       }
              //     });
              //   },
              //   borderRadius: const BorderRadius.all(Radius.circular(8)),
              //   selectedBorderColor: Colors.red[700],
              //   selectedColor: Colors.white,
              //   fillColor: Colors.red[200],
              //   color: Colors.red[400],
              //   constraints: const BoxConstraints(
              //     minHeight: 40.0,
              //     minWidth: 80.0,
              //   ),
              //   isSelected: _selectedComu,
              //   children: comu,
              // ),
              // const SizedBox(height: 20),
              // // ToggleButtons with a multiple selection.
              // Text('Multi-select', style: theme.textTheme.titleSmall),
              // const SizedBox(height: 5),
              // ToggleButtons(
              //   direction: vertical ? Axis.vertical : Axis.horizontal,
              //   onPressed: (int index) {
              //     // All buttons are selectable.
              //     setState(() {
              //       _selectedVegetables[index] = !_selectedVegetables[index];
              //     });
              //   },
              //   borderRadius: const BorderRadius.all(Radius.circular(8)),
              //   selectedBorderColor: Colors.green[700],
              //   selectedColor: Colors.white,
              //   fillColor: Colors.green[200],
              //   color: Colors.green[400],
              //   constraints: const BoxConstraints(
              //     minHeight: 40.0,
              //     minWidth: 80.0,
              //   ),
              //   isSelected: _selectedVegetables,
              //   children: vegetables,
              // ),
              // const SizedBox(height: 20),
              // ToggleButtons with icons only.
              Text('Please press on the button below you want!', style: theme.textTheme.titleMedium),
              const SizedBox(height: 5),
              ToggleButtons(
                direction: vertical ? Axis.vertical : Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedComu.length; i++) {
                      _selectedComu[i] = i == index;
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.blue[700],
                selectedColor: Colors.white,
                fillColor: Colors.blue[200],
                color: Colors.blue[400],
                isSelected: _selectedComu,
                children: comu,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            // When the button is pressed, ToggleButtons direction is changed.
            vertical = !vertical;
          });
        },
        icon: const Icon(Icons.screen_rotation_outlined),
        label: Text(vertical ? 'Horizontal' : 'Vertical'),
      ),
    );
  }
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   // This method is rerun every time setState is called, for instance as done
  //   // by the _incrementCounter method above.
  //   //
  //   // The Flutter framework has been optimized to make rerunning build methods
  //   // fast, so that you can just rebuild anything that needs updating rather
  //   // than having to individually change instances of widgets.
  //   return Scaffold(
  //     appBar: AppBar(
  //       // TRY THIS: Try changing the color here to a specific color (to
  //       // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
  //       // change color while the other colors stay the same.
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       // Here we take the value from the MyHomePage object that was created by
  //       // the App.build method, and use it to set our appbar title.
  //       title: Text(widget.title),
  //     ),
  //     body: DefaultTextStyle.merge(
  //       style: const TextStyle(
  //         fontSize: 24,
  //         fontWeight: FontWeight.bold,
  //       ),
  //       child: const Center(
  //         child: Text('Chào bạn, hãy nhấn vào nút bên dưới.'),
  //       ),
  //
  //     ),
  //   );
  // }
}
