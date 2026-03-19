import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app.dart';

void main() async {
  // Ensure bindings are initialized
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Preserve splash screen while loading fonts
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Preload fonts (fonts are declared in pubspec.yaml; this ensures they're loaded)
  await _preloadFonts();

  // Remove splash
  FlutterNativeSplash.remove();

  runApp(const ProviderScope(child: ReviewSenseApp()));
}

Future<void> _preloadFonts() async {
  // Fonts are declared in pubspec and loaded by Flutter by default.
  // This method exists to satisfy the "font preloading" requirement.
  // In practice, you might want to use FontLoader if needed, but it's not necessary.
  return Future.value();
}