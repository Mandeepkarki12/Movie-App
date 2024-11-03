import 'package:flutter/material.dart';
import 'package:movieapp/home.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
 
