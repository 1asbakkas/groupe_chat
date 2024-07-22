import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Groupe chat"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          child: const Icon(Icons.add),
          onPressed: () {
            openDialog();
          },
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("name the groupe"),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: "tape the goupe name"),
          ),
          actions: [
            TextButton(
              child: Text("submit"),
              onPressed: submit,
            ),
          ],
        ),
      );
  void submit() {
    Navigator.of(context).pop();
  }
}
