import 'dart:async';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class DynamicBlurBackground extends StatefulWidget {
  @override
  _DynamicBlurBackgroundState createState() => _DynamicBlurBackgroundState();
}

class _DynamicBlurBackgroundState extends State<DynamicBlurBackground> {
  late Color _color;
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
  ];

  @override
  void initState() {
    super.initState();
    _color = _colors[0];
    _changeColor();
  }

  _changeColor() {
    Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() {
        _color = _colors[(t.tick) % _colors.length];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 5),
      decoration: BoxDecoration(color: _color),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.black.withOpacity(0),
          child: Center(child: Text('Dynamic Blur Background')),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(body: DynamicBlurBackground()),
    ));
