import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:reviewsense_frontend/core/theme/colors.dart';
import 'package:reviewsense_frontend/shared/painters/glass_card_painter.dart';

class GlassContainer extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final bool animateBorder;
  final double blur;
  final Gradient? borderGradient;

  const GlassContainer({
    super.key,
    this.child,
    this.width = double.infinity,
    this.height = double.infinity,
    this.padding = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.animateBorder = false,
    this.blur = 20,
    this.borderGradient,
  });

  @override
  Widget build(BuildContext context) {
    final glassContent = ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.white.withOpacity(0.08),
                AppColors.white.withOpacity(0.03),
              ],
            ),
          ),
          child: child,
        ),
      ),
    );

    if (borderGradient != null) {
      // Gradient border: outer container carries the gradient, 1 px inset reveals it.
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: borderGradient,
          borderRadius: borderRadius,
        ),
        padding: const EdgeInsets.all(1.0),
        child: glassContent,
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: GlassCardPainter(
          borderRadius: borderRadius,
          animateBorder: animateBorder,
        ),
        child: glassContent,
      ),
    );
  }
}