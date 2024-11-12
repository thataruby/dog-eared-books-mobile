import 'package:flutter/material.dart';
import 'package:dog_eared_books/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Eared Books',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(secondary: const Color.fromARGB(255, 36, 172, 43)),
      ),
      home: MyHomePage(),
    );
  }
}