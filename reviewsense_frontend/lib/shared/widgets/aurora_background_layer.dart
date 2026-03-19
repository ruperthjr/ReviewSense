import 'package:flutter/material.dart';
import 'package:reviewsense_frontend/shared/animations/aurora_pulse_controller.dart';
import 'package:reviewsense_frontend/shared/painters/aurora_mesh_painter.dart';

// child is optional: when used as a Stack layer, pass no child.
class AuroraBackgroundLayer extends StatefulWidget {
  final Widget? child;

  const AuroraBackgroundLayer({super.key, this.child});

  @override
  State<AuroraBackgroundLayer> createState() => _AuroraBackgroundLayerState();
}

class _AuroraBackgroundLayerState extends State<AuroraBackgroundLayer> {
  late final AuroraPulseController _auroraController;

  @override
  void initState() {
    super.initState();
    _auroraController = AuroraPulseController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _auroraController,
            builder: (context, _) {
              return CustomPaint(
                painter: AuroraMeshPainter(
                  animationValue: _auroraController.value,
                ),
                size: Size.infinite,
              );
            },
          ),
        ),
        if (widget.child != null) widget.child!,
      ],
    );
  }

  @override
  void dispose() {
    _auroraController.dispose();
    super.dispose();
  }
}