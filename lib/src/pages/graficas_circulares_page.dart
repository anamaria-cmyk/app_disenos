// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class GraficaCircularesPage extends StatefulWidget {

  @override
  State<GraficaCircularesPage> createState() => _GraficaCircularesPageState();
}

class _GraficaCircularesPageState extends State<GraficaCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.refresh_rounded),
        onPressed: () {
          
        }
      ),
      body: Center(
        child: Text('$porcentaje %'),
      ),
    );
  }
}