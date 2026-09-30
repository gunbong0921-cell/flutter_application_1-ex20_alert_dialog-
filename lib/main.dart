import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String _sPersonName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'show AlertDialog',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onPressed: () => _showAlertDialog(context, 'hello~'),
            ),
          ],
        ),
      ),
    );
  }

  // void showAlertDialog() async {
  Future _showAlertDialog(BuildContext context, String message) async {
    await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(
            dialogTheme: const DialogThemeData(backgroundColor: Colors.orange),
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            title: Text('AlertDialog Example'),
            content: SizedBox(
              height: 90,
              child: Column(
                children: [
                  Text(message),
                  TextField(
                    // autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: '홍길동',
                    ),
                    onChanged: (value) {
                      _sPersonName = value;
                    },
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context, 'OK');
                  debugPrint('OK - $_sPersonName');
                },
              ),
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                  debugPrint('Cancel');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
