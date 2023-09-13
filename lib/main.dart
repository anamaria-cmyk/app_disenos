//import 'package:disenos_app/src/pages/headers_pages.dart';
import 'package:flutter/material.dart';
import 'src/labs/circular_progress_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: CircularProgressPages()
    );
  }
}