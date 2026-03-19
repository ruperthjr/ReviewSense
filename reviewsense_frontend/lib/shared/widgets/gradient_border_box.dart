import 'package:flutter/material.dart';
import 'package:reviewsense_frontend/core/theme/colors.dart';

class GradientBorderBox extends StatefulWidget {
  final Widget child;
  final double borderWidth;
  final BorderRadius borderRadius;
  final List<Color> gradientColors;

  const GradientBorderBox({
    super.key,
    required this.child,
    this.borderWidth = 1.5,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.gradientColors = const [AppColors.amber, AppColors.blue, AppColors.neonGreen],
  });

  @override
  State<GradientBorderBox> createState() => _GradientBorderBoxState();
}

class _GradientBorderBoxState extends State<GradientBorderBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _GradientBorderPainter(
            angle: _controller.value * 2 * 3.14159,
            borderWidth: widget.borderWidth,
            borderRadius: widget.borderRadius,
            gradientColors: widget.gradientColors,
          ),
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

class _GradientBorderPainter extends CustomPainter {
  final double angle;
  final double borderWidth;
  final BorderRadius borderRadius;
  final List<Color> gradientColors;

  _GradientBorderPainter({
    required this.angle,
    required this.borderWidth,
    required this.borderRadius,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final shader = SweepGradient(
      startAngle: angle,
      endAngle: angle + 2 * 3.14159,
      colors: gradientColors,
      stops: [0.0, 0.5, 1.0],
    ).createShader(rect);
    paint.shader = shader;

    final rrect = borderRadius.toRRect(rect);
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(_GradientBorderPainter oldDelegate) {
    return oldDelegate.angle != angle;
  }
}