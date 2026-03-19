import 'package:flutter/material.dart';
import 'package:reviewsense_frontend/shared/animations/holographic_shimmer_controller.dart';
import 'package:reviewsense_frontend/shared/painters/holographic_shimmer_painter.dart';

// child is optional: when used as a Stack overlay, pass no child.
class HolographicShimmerLayer extends StatefulWidget {
  final Widget? child;
  final double opacity;

  const HolographicShimmerLayer({
    super.key,
    this.child,
    this.opacity = 1.0,
  });

  @override
  State<HolographicShimmerLayer> createState() =>
      _HolographicShimmerLayerState();
}

class _HolographicShimmerLayerState extends State<HolographicShimmerLayer> {
  late final HolographicShimmerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HolographicShimmerController();
  }

  @override
  Widget build(BuildContext context) {
    final shimmer = Positioned.fill(
      child: IgnorePointer(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Opacity(
              opacity: widget.opacity.clamp(0.0, 1.0),
              child: CustomPaint(
                painter:
                    HolographicShimmerPainter(offset: _controller.offset),
              ),
            );
          },
        ),
      ),
    );

    if (widget.child == null) return shimmer;

    return Stack(children: [widget.child!, shimmer]);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}