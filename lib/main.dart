import 'package:flutter/material.dart';
import 'package:scordomna/Screen/Home_Screen.dart';

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
          appBar: AppBar(title: const Text("Calculator")),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: HomeSceen(
                name: "Team A",
              )),
              const VerticalDivider(
                color: Colors.black,
                thickness: 5,
                indent: 20,
                endIndent: 20,
                width: 10,
              ),
              Expanded(
                  child: HomeSceen(
                name: "Team B",
              )),
            ],
          )),
    );
  }
}
