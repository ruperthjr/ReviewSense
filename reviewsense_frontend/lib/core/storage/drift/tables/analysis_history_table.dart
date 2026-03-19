import 'package:drift/drift.dart';

class AnalysisHistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get reviewText => text()();
  TextColumn get sentimentLabel => text()();
  RealColumn get sentimentScore => real()();
  RealColumn get authenticityScore => real()();
  TextColumn get authenticityLabel => text()();
  TextColumn get summary => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}