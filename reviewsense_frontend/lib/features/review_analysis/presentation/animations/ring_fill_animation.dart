import 'package:flutter/material.dart';
import '../painters/score_ring_painter.dart';

class RingFillAnimation extends StatefulWidget {
  final double targetScore;
  final Color color;
  final Duration duration;
  final Curve curve;
  final Widget? child;

  const RingFillAnimation({
    super.key,
    required this.targetScore,
    required this.color,
    this.duration = const Duration(milliseconds: 1200),
    this.curve = Curves.easeOutCubic,
    this.child,
  });

  @override
  State<RingFillAnimation> createState() => _RingFillAnimationState();
}

class _RingFillAnimationState extends State<RingFillAnimation>
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
      curve: widget.curve,
    ).drive(Tween<double>(begin: 0.0, end: widget.targetScore));
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant RingFillAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.targetScore != widget.targetScore) {
      _animation = CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ).drive(Tween<double>(begin: _animation.value, end: widget.targetScore));
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: ScoreRingPainter(
            score: _animation.value,
            color: widget.color,
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: widget.child,
          ),
        );
      },
    );
  }
}