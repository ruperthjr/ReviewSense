// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AnalysisHistoryTableTable extends AnalysisHistoryTable
    with TableInfo<$AnalysisHistoryTableTable, AnalysisHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnalysisHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _reviewTextMeta =
      const VerificationMeta('reviewText');
  @override
  late final GeneratedColumn<String> reviewText = GeneratedColumn<String>(
      'review_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sentimentLabelMeta =
      const VerificationMeta('sentimentLabel');
  @override
  late final GeneratedColumn<String> sentimentLabel = GeneratedColumn<String>(
      'sentiment_label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sentimentScoreMeta =
      const VerificationMeta('sentimentScore');
  @override
  late final GeneratedColumn<double> sentimentScore = GeneratedColumn<double>(
      'sentiment_score', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _authenticityScoreMeta =
      const VerificationMeta('authenticityScore');
  @override
  late final GeneratedColumn<double> authenticityScore =
      GeneratedColumn<double>('authenticity_score', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _authenticityLabelMeta =
      const VerificationMeta('authenticityLabel');
  @override
  late final GeneratedColumn<String> authenticityLabel =
      GeneratedColumn<String>('authenticity_label', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        reviewText,
        sentimentLabel,
        sentimentScore,
        authenticityScore,
        authenticityLabel,
        summary,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'analysis_history_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AnalysisHistoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('review_text')) {
      context.handle(
          _reviewTextMeta,
          reviewText.isAcceptableOrUnknown(
              data['review_text']!, _reviewTextMeta));
    } else if (isInserting) {
      context.missing(_reviewTextMeta);
    }
    if (data.containsKey('sentiment_label')) {
      context.handle(
          _sentimentLabelMeta,
          sentimentLabel.isAcceptableOrUnknown(
              data['sentiment_label']!, _sentimentLabelMeta));
    } else if (isInserting) {
      context.missing(_sentimentLabelMeta);
    }
    if (data.containsKey('sentiment_score')) {
      context.handle(
          _sentimentScoreMeta,
          sentimentScore.isAcceptableOrUnknown(
              data['sentiment_score']!, _sentimentScoreMeta));
    } else if (isInserting) {
      context.missing(_sentimentScoreMeta);
    }
    if (data.containsKey('authenticity_score')) {
      context.handle(
          _authenticityScoreMeta,
          authenticityScore.isAcceptableOrUnknown(
              data['authenticity_score']!, _authenticityScoreMeta));
    } else if (isInserting) {
      context.missing(_authenticityScoreMeta);
    }
    if (data.containsKey('authenticity_label')) {
      context.handle(
          _authenticityLabelMeta,
          authenticityLabel.isAcceptableOrUnknown(
              data['authenticity_label']!, _authenticityLabelMeta));
    } else if (isInserting) {
      context.missing(_authenticityLabelMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnalysisHistoryTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnalysisHistoryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      reviewText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}review_text'])!,
      sentimentLabel: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}sentiment_label'])!,
      sentimentScore: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}sentiment_score'])!,
      authenticityScore: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}authenticity_score'])!,
      authenticityLabel: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}authenticity_label'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AnalysisHistoryTableTable createAlias(String alias) {
    return $AnalysisHistoryTableTable(attachedDatabase, alias);
  }
}

class AnalysisHistoryTableData extends DataClass
    implements Insertable<AnalysisHistoryTableData> {
  final int id;
  final String reviewText;
  final String sentimentLabel;
  final double sentimentScore;
  final double authenticityScore;
  final String authenticityLabel;
  final String summary;
  final DateTime createdAt;
  const AnalysisHistoryTableData(
      {required this.id,
      required this.reviewText,
      required this.sentimentLabel,
      required this.sentimentScore,
      required this.authenticityScore,
      required this.authenticityLabel,
      required this.summary,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['review_text'] = Variable<String>(reviewText);
    map['sentiment_label'] = Variable<String>(sentimentLabel);
    map['sentiment_score'] = Variable<double>(sentimentScore);
    map['authenticity_score'] = Variable<double>(authenticityScore);
    map['authenticity_label'] = Variable<String>(authenticityLabel);
    map['summary'] = Variable<String>(summary);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AnalysisHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return AnalysisHistoryTableCompanion(
      id: Value(id),
      reviewText: Value(reviewText),
      sentimentLabel: Value(sentimentLabel),
      sentimentScore: Value(sentimentScore),
      authenticityScore: Value(authenticityScore),
      authenticityLabel: Value(authenticityLabel),
      summary: Value(summary),
      createdAt: Value(createdAt),
    );
  }

  factory AnalysisHistoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnalysisHistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      reviewText: serializer.fromJson<String>(json['reviewText']),
      sentimentLabel: serializer.fromJson<String>(json['sentimentLabel']),
      sentimentScore: serializer.fromJson<double>(json['sentimentScore']),
      authenticityScore: serializer.fromJson<double>(json['authenticityScore']),
      authenticityLabel: serializer.fromJson<String>(json['authenticityLabel']),
      summary: serializer.fromJson<String>(json['summary']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reviewText': serializer.toJson<String>(reviewText),
      'sentimentLabel': serializer.toJson<String>(sentimentLabel),
      'sentimentScore': serializer.toJson<double>(sentimentScore),
      'authenticityScore': serializer.toJson<double>(authenticityScore),
      'authenticityLabel': serializer.toJson<String>(authenticityLabel),
      'summary': serializer.toJson<String>(summary),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AnalysisHistoryTableData copyWith(
          {int? id,
          String? reviewText,
          String? sentimentLabel,
          double? sentimentScore,
          double? authenticityScore,
          String? authenticityLabel,
          String? summary,
          DateTime? createdAt}) =>
      AnalysisHistoryTableData(
        id: id ?? this.id,
        reviewText: reviewText ?? this.reviewText,
        sentimentLabel: sentimentLabel ?? this.sentimentLabel,
        sentimentScore: sentimentScore ?? this.sentimentScore,
        authenticityScore: authenticityScore ?? this.authenticityScore,
        authenticityLabel: authenticityLabel ?? this.authenticityLabel,
        summary: summary ?? this.summary,
        createdAt: createdAt ?? this.createdAt,
      );
  AnalysisHistoryTableData copyWithCompanion(
      AnalysisHistoryTableCompanion data) {
    return AnalysisHistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      reviewText:
          data.reviewText.present ? data.reviewText.value : this.reviewText,
      sentimentLabel: data.sentimentLabel.present
          ? data.sentimentLabel.value
          : this.sentimentLabel,
      sentimentScore: data.sentimentScore.present
          ? data.sentimentScore.value
          : this.sentimentScore,
      authenticityScore: data.authenticityScore.present
          ? data.authenticityScore.value
          : this.authenticityScore,
      authenticityLabel: data.authenticityLabel.present
          ? data.authenticityLabel.value
          : this.authenticityLabel,
      summary: data.summary.present ? data.summary.value : this.summary,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnalysisHistoryTableData(')
          ..write('id: $id, ')
          ..write('reviewText: $reviewText, ')
          ..write('sentimentLabel: $sentimentLabel, ')
          ..write('sentimentScore: $sentimentScore, ')
          ..write('authenticityScore: $authenticityScore, ')
          ..write('authenticityLabel: $authenticityLabel, ')
          ..write('summary: $summary, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reviewText, sentimentLabel,
      sentimentScore, authenticityScore, authenticityLabel, summary, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnalysisHistoryTableData &&
          other.id == this.id &&
          other.reviewText == this.reviewText &&
          other.sentimentLabel == this.sentimentLabel &&
          other.sentimentScore == this.sentimentScore &&
          other.authenticityScore == this.authenticityScore &&
          other.authenticityLabel == this.authenticityLabel &&
          other.summary == this.summary &&
          other.createdAt == this.createdAt);
}

class AnalysisHistoryTableCompanion
    extends UpdateCompanion<AnalysisHistoryTableData> {
  final Value<int> id;
  final Value<String> reviewText;
  final Value<String> sentimentLabel;
  final Value<double> sentimentScore;
  final Value<double> authenticityScore;
  final Value<String> authenticityLabel;
  final Value<String> summary;
  final Value<DateTime> createdAt;
  const AnalysisHistoryTableCompanion({
    this.id = const Value.absent(),
    this.reviewText = const Value.absent(),
    this.sentimentLabel = const Value.absent(),
    this.sentimentScore = const Value.absent(),
    this.authenticityScore = const Value.absent(),
    this.authenticityLabel = const Value.absent(),
    this.summary = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AnalysisHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String reviewText,
    required String sentimentLabel,
    required double sentimentScore,
    required double authenticityScore,
    required String authenticityLabel,
    required String summary,
    this.createdAt = const Value.absent(),
  })  : reviewText = Value(reviewText),
        sentimentLabel = Value(sentimentLabel),
        sentimentScore = Value(sentimentScore),
        authenticityScore = Value(authenticityScore),
        authenticityLabel = Value(authenticityLabel),
        summary = Value(summary);
  static Insertable<AnalysisHistoryTableData> custom({
    Expression<int>? id,
    Expression<String>? reviewText,
    Expression<String>? sentimentLabel,
    Expression<double>? sentimentScore,
    Expression<double>? authenticityScore,
    Expression<String>? authenticityLabel,
    Expression<String>? summary,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reviewText != null) 'review_text': reviewText,
      if (sentimentLabel != null) 'sentiment_label': sentimentLabel,
      if (sentimentScore != null) 'sentiment_score': sentimentScore,
      if (authenticityScore != null) 'authenticity_score': authenticityScore,
      if (authenticityLabel != null) 'authenticity_label': authenticityLabel,
      if (summary != null) 'summary': summary,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AnalysisHistoryTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? reviewText,
      Value<String>? sentimentLabel,
      Value<double>? sentimentScore,
      Value<double>? authenticityScore,
      Value<String>? authenticityLabel,
      Value<String>? summary,
      Value<DateTime>? createdAt}) {
    return AnalysisHistoryTableCompanion(
      id: id ?? this.id,
      reviewText: reviewText ?? this.reviewText,
      sentimentLabel: sentimentLabel ?? this.sentimentLabel,
      sentimentScore: sentimentScore ?? this.sentimentScore,
      authenticityScore: authenticityScore ?? this.authenticityScore,
      authenticityLabel: authenticityLabel ?? this.authenticityLabel,
      summary: summary ?? this.summary,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reviewText.present) {
      map['review_text'] = Variable<String>(reviewText.value);
    }
    if (sentimentLabel.present) {
      map['sentiment_label'] = Variable<String>(sentimentLabel.value);
    }
    if (sentimentScore.present) {
      map['sentiment_score'] = Variable<double>(sentimentScore.value);
    }
    if (authenticityScore.present) {
      map['authenticity_score'] = Variable<double>(authenticityScore.value);
    }
    if (authenticityLabel.present) {
      map['authenticity_label'] = Variable<String>(authenticityLabel.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnalysisHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('reviewText: $reviewText, ')
          ..write('sentimentLabel: $sentimentLabel, ')
          ..write('sentimentScore: $sentimentScore, ')
          ..write('authenticityScore: $authenticityScore, ')
          ..write('authenticityLabel: $authenticityLabel, ')
          ..write('summary: $summary, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AnalysisHistoryTableTable analysisHistoryTable =
      $AnalysisHistoryTableTable(this);
  late final AnalysisHistoryDao analysisHistoryDao =
      AnalysisHistoryDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [analysisHistoryTable];
}

typedef $$AnalysisHistoryTableTableCreateCompanionBuilder
    = AnalysisHistoryTableCompanion Function({
  Value<int> id,
  required String reviewText,
  required String sentimentLabel,
  required double sentimentScore,
  required double authenticityScore,
  required String authenticityLabel,
  required String summary,
  Value<DateTime> createdAt,
});
typedef $$AnalysisHistoryTableTableUpdateCompanionBuilder
    = AnalysisHistoryTableCompanion Function({
  Value<int> id,
  Value<String> reviewText,
  Value<String> sentimentLabel,
  Value<double> sentimentScore,
  Value<double> authenticityScore,
  Value<String> authenticityLabel,
  Value<String> summary,
  Value<DateTime> createdAt,
});

class $$AnalysisHistoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AnalysisHistoryTableTable,
    AnalysisHistoryTableData,
    $$AnalysisHistoryTableTableFilterComposer,
    $$AnalysisHistoryTableTableOrderingComposer,
    $$AnalysisHistoryTableTableCreateCompanionBuilder,
    $$AnalysisHistoryTableTableUpdateCompanionBuilder> {
  $$AnalysisHistoryTableTableTableManager(
      _$AppDatabase db, $AnalysisHistoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$AnalysisHistoryTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$AnalysisHistoryTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> reviewText = const Value.absent(),
            Value<String> sentimentLabel = const Value.absent(),
            Value<double> sentimentScore = const Value.absent(),
            Value<double> authenticityScore = const Value.absent(),
            Value<String> authenticityLabel = const Value.absent(),
            Value<String> summary = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              AnalysisHistoryTableCompanion(
            id: id,
            reviewText: reviewText,
            sentimentLabel: sentimentLabel,
            sentimentScore: sentimentScore,
            authenticityScore: authenticityScore,
            authenticityLabel: authenticityLabel,
            summary: summary,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String reviewText,
            required String sentimentLabel,
            required double sentimentScore,
            required double authenticityScore,
            required String authenticityLabel,
            required String summary,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              AnalysisHistoryTableCompanion.insert(
            id: id,
            reviewText: reviewText,
            sentimentLabel: sentimentLabel,
            sentimentScore: sentimentScore,
            authenticityScore: authenticityScore,
            authenticityLabel: authenticityLabel,
            summary: summary,
            createdAt: createdAt,
          ),
        ));
}

class $$AnalysisHistoryTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AnalysisHistoryTableTable> {
  $$AnalysisHistoryTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get reviewText => $state.composableBuilder(
      column: $state.table.reviewText,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sentimentLabel => $state.composableBuilder(
      column: $state.table.sentimentLabel,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get sentimentScore => $state.composableBuilder(
      column: $state.table.sentimentScore,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get authenticityScore => $state.composableBuilder(
      column: $state.table.authenticityScore,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get authenticityLabel => $state.composableBuilder(
      column: $state.table.authenticityLabel,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get summary => $state.composableBuilder(
      column: $state.table.summary,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AnalysisHistoryTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AnalysisHistoryTableTable> {
  $$AnalysisHistoryTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get reviewText => $state.composableBuilder(
      column: $state.table.reviewText,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sentimentLabel => $state.composableBuilder(
      column: $state.table.sentimentLabel,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get sentimentScore => $state.composableBuilder(
      column: $state.table.sentimentScore,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get authenticityScore => $state.composableBuilder(
      column: $state.table.authenticityScore,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get authenticityLabel => $state.composableBuilder(
      column: $state.table.authenticityLabel,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get summary => $state.composableBuilder(
      column: $state.table.summary,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AnalysisHistoryTableTableTableManager get analysisHistoryTable =>
      $$AnalysisHistoryTableTableTableManager(_db, _db.analysisHistoryTable);
}
