import 'package:flutter/material.dart';
import 'package:vk/vk.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Keyboard Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Virtual Keyboard Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Holds the text that user typed.
  String text = '';

  // True if shift enabled.
  bool shiftEnabled = false;

  // is true will show the numeric keyboard.
  bool isNumericMode = false;

  late TextEditingController _controllerText;

  @override
  void initState() {
    _controllerText = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  children: [
                    TextField(
                      controller: _controllerText,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your text',
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      controller: _controllerText,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your text',
                      ),
                    ),
                  ],
                )),
            SwitchListTile(
              title: Text(
                'Keyboard Type = ' +
                    (isNumericMode
                        ? 'VirtualKeyboardType.Numeric'
                        : 'VirtualKeyboardType.Alphanumeric'),
              ),
              value: isNumericMode,
              onChanged: (val) {
                setState(() {
                  isNumericMode = val;
                });
              },
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              child: VirtualKeyboard(
                  height: 300,
                  type: isNumericMode
                      ? VirtualKeyboardType.Numeric
                      : VirtualKeyboardType.Alphanumeric,
                  textController: _controllerText),
            )
          ],
        ),
      ),
    );
  }
}
