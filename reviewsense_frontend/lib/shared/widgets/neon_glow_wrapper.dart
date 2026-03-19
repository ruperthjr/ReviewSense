import 'package:flutter/material.dart';
import 'package:reviewsense_frontend/core/theme/colors.dart';

class NeonGlowWrapper extends StatefulWidget {
  final Widget child;
  final Color color;
  final double intensity;
  final double blurRadius;
  final VoidCallback? onTap;

  const NeonGlowWrapper({
    super.key,
    required this.child,
    this.color = AppColors.amber,
    this.intensity = 1.0,
    this.blurRadius = 20,
    this.onTap,
  });

  @override
  State<NeonGlowWrapper> createState() => _NeonGlowWrapperState();
}

class _NeonGlowWrapperState extends State<NeonGlowWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void _handleTap() {
    _controller.forward().then((_) => _controller.reverse());
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: widget.color
                      .withOpacity(widget.intensity * _animation.value),
                  blurRadius: widget.blurRadius,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}