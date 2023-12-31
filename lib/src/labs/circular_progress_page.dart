// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CircularProgressPages extends StatefulWidget {
  @override
  State<CircularProgressPages> createState() => _CircularProgressPagesState();
}

class _CircularProgressPagesState extends State<CircularProgressPages> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  double porcentaje      = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {

    controller = AnimationController(vsync: this, duration: const Duration( milliseconds: 800 ));

    controller.addListener(() {
      
      //('valor controller: ${ controller.value }');
        setState(() {
           porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
        });
    });

    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {

          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if ( nuevoPorcentaje > 100 ) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }
          controller.forward( from: 0.0 );
          setState(() {});
        },
        child: const Icon( Icons.refresh_rounded),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress( porcentaje ),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {

  final porcentaje;
  _MiRadialProgress( this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {

    //circulo completado
      final  paint  = Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

      final  center = Offset( size.width * 0.5, size.height / 2 );
      final  radio  = min( size.width * 0.5, size.height * 0.5  );

      canvas.drawCircle(center, radio, paint);

      //arco
      final paintArco  = Paint()
      ..strokeWidth    = 10
      ..color          = Colors.pink
      ..style          = PaintingStyle.stroke;

      //parte que se debe ir llenando
      double arcAngle  = 2 * pi * ( porcentaje / 100 ); 
      canvas.drawArc( 
      Rect.fromCircle(center: center, radius: radio), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArco
    );

  }

  @override
  bool shouldRepaint( CustomPainter oldDelegate) => true;
}