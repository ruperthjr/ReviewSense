import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reviewsense_frontend/core/router/app_router.dart';
import 'package:reviewsense_frontend/core/theme/app_theme.dart';

// appRouterProvider is generated in app_router.g.dart via the part directive in app_router.dart
class ReviewSenseApp extends ConsumerWidget {
  const ReviewSenseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'ReviewSense',
      theme: AppTheme.dark,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}