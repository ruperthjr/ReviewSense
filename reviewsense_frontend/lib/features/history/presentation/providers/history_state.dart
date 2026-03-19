import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/history_entry.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.loading() = _Loading;
  const factory HistoryState.loaded(List<HistoryEntry> entries) = _Loaded;
  const factory HistoryState.empty() = _Empty;
  const factory HistoryState.error(String message) = _Error;
}