import 'package:flutter/material.dart';

class ScaleSpringAnimator extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ScaleSpringAnimator({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<ScaleSpringAnimator> createState() => _ScaleSpringAnimatorState();
}

class _ScaleSpringAnimatorState extends State<ScaleSpringAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}