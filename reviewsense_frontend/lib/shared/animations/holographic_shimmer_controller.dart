import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HolographicShimmerController extends ChangeNotifier {
  late final AnimationController _controller;
  double _offset = 0.0;

  HolographicShimmerController() {
    _controller = AnimationController(
      vsync: const _DummyTickerProvider(),
      duration: const Duration(seconds: 2),
    )
      ..addListener(_onTick)
      ..repeat();
  }

  void _onTick() {
    _offset = _controller.value;
    notifyListeners();
  }

  double get offset => _offset;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _DummyTickerProvider implements TickerProvider {
  const _DummyTickerProvider();

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}