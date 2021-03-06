import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/numeric_input_keyboard.dart';
import 'package:keyboard/widget_keyboard/qwerty_input_keyboard.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Keyboard Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Virtual Keyboard Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String inputText = "";
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "title"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Password: $inputText"),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: showQwertyKeyboard,
                    child: const Text("Enter password")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showInputKeyboard() async {
    String? txt = await showModalBottomSheet<String>(
        context: context,
        builder: (BuildContext context) {
          return NumericInputKeyboard(
            textController: controller,
            floatingPoint: true,
            validator: validateNumber,
            errorText: "Not long enough",
            labelText: "Long number",
          );
        });
    setState(() {
      if (txt != null) {
        inputText = txt;
      }
    });
  }

  Future<bool> validateNumber(String str) async {
    return str.length > 4;
  }

  showQwertyKeyboard() async {
    String? txt = await showModalBottomSheet<String>(
        context: context,
        builder: (BuildContext context) {
          return QwertInputKeyboard(
            textController: controller,
            validator: validateText,
            errorText: "Empty text",
            labelText: "Text",
          );
        });
    if (txt != null) {
      setState(() {
        inputText = txt;
      });
    }
  }

  Future<bool> validateText(String str) async {
    return str.isNotEmpty;
  }
}
