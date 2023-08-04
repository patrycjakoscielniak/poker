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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 49, 102, 51),
        body: Center(
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Start Game',
                  style: TextStyle(color: Colors.black),
                ))),
      ),
    );
  }
}
