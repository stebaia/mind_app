// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// ignore_for_file: type=lint
class $SecretNoteTable extends SecretNote
    with TableInfo<$SecretNoteTable, SecretNoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SecretNoteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'datetime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, content, date];
  @override
  String get aliasedName => _alias ?? 'secret_note';
  @override
  String get actualTableName => 'secret_note';
  @override
  VerificationContext validateIntegrity(Insertable<SecretNoteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['body']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('datetime')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['datetime']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SecretNoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SecretNoteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}datetime'])!,
    );
  }

  @override
  $SecretNoteTable createAlias(String alias) {
    return $SecretNoteTable(attachedDatabase, alias);
  }
}

class SecretNoteData extends DataClass implements Insertable<SecretNoteData> {
  final int id;
  final String title;
  final String content;
  final String date;
  const SecretNoteData(
      {required this.id,
      required this.title,
      required this.content,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(content);
    map['datetime'] = Variable<String>(date);
    return map;
  }

  SecretNoteCompanion toCompanion(bool nullToAbsent) {
    return SecretNoteCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      date: Value(date),
    );
  }

  factory SecretNoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SecretNoteData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      date: serializer.fromJson<String>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'date': serializer.toJson<String>(date),
    };
  }

  SecretNoteData copyWith(
          {int? id, String? title, String? content, String? date}) =>
      SecretNoteData(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('SecretNoteData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SecretNoteData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.date == this.date);
}

class SecretNoteCompanion extends UpdateCompanion<SecretNoteData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String> date;
  const SecretNoteCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
  });
  SecretNoteCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    required String date,
  })  : title = Value(title),
        content = Value(content),
        date = Value(date);
  static Insertable<SecretNoteData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (date != null) 'datetime': date,
    });
  }

  SecretNoteCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String>? date}) {
    return SecretNoteCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (date.present) {
      map['datetime'] = Variable<String>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SecretNoteCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $SecretNoteTable secretNote = $SecretNoteTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [secretNote];
}
