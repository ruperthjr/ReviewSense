// Plain class — no freezed needed.
// Delete lib/core/error/failure.freezed.dart before running.
class Failure {
  final String message;
  const Failure({required this.message});

  @override
  String toString() => 'Failure(message: $message)';
}