import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AuroraPulseController extends ChangeNotifier {
  late final AnimationController _controller;
  double _value = 0.0;

  AuroraPulseController() {
    _controller = AnimationController(
      vsync: const _DummyTickerProvider(),
      duration: const Duration(seconds: 8),
    )
      ..addListener(_onTick)
      ..repeat();
  }

  void _onTick() {
    _value = _controller.value;
    notifyListeners();
  }

  double get value => _value;

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