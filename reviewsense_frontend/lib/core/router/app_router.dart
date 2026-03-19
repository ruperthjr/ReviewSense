import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:reviewsense_frontend/core/constants/route_constants.dart';
// These screens will be implemented in features. For now, we assume they exist.
import 'package:reviewsense_frontend/features/review_analysis/presentation/screens/input_screen.dart';
import 'package:reviewsense_frontend/features/review_analysis/presentation/screens/results_screen.dart';
import 'package:reviewsense_frontend/features/history/presentation/screens/history_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: RouteConstants.input,
    routes: [
      GoRoute(
        path: RouteConstants.input,
        name: 'input',
        builder: (context, state) => const InputScreen(),
      ),
      GoRoute(
        path: RouteConstants.results,
        name: 'results',
        builder: (context, state) => const ResultsScreen(),
      ),
      GoRoute(
        path: RouteConstants.history,
        name: 'history',
        builder: (context, state) => const HistoryScreen(),
      ),
    ],
  );
}
