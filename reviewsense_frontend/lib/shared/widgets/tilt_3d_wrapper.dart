import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Tilt3DWrapper extends StatefulWidget {
  final Widget child;
  final double maxTilt;

  const Tilt3DWrapper({
    super.key,
    required this.child,
    this.maxTilt = 12.0,
  });

  @override
  State<Tilt3DWrapper> createState() => _Tilt3DWrapperState();
}

class _Tilt3DWrapperState extends State<Tilt3DWrapper>
    with SingleTickerProviderStateMixin {
  double _x = 0.0;
  double _y = 0.0;
  late AnimationController _controller;
  late Animation<double> _xAnimation;
  late Animation<double> _yAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    accelerometerEventStream().listen((AccelerometerEvent event) {
      final newX =
          (event.y / 9.8).clamp(-1.0, 1.0) * widget.maxTilt * pi / 180;
      final newY =
          (event.x / 9.8).clamp(-1.0, 1.0) * widget.maxTilt * pi / 180;

      _xAnimation = Tween<double>(begin: _x, end: newX).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      );
      _yAnimation = Tween<double>(begin: _y, end: newY).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      );

      setState(() {
        _x = newX;
        _y = newY;
      });
      _controller.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(_xAnimation.value)
            ..rotateY(_yAnimation.value),
          alignment: Alignment.center,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}