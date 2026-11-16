import 'package:flutter/material.dart';
import 'package:initial_avatar/initial_avatar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Initial Avatar Demo'),
        ),
        body: const Center(
          child: InitialAvatar(
            name: 'John Doe',
            radius: 40,
            backgroundColor: Colors.purple,
          ),
        ),
      ),
    );
  }
}