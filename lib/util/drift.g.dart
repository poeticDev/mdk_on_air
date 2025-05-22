// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift.dart';

// ignore_for_file: type=lint
class $BasicInfoTable extends BasicInfo
    with TableInfo<$BasicInfoTable, BasicInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BasicInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wifiNameMeta = const VerificationMeta(
    'wifiName',
  );
  @override
  late final GeneratedColumn<String> wifiName = GeneratedColumn<String>(
    'wifi_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverIpMeta = const VerificationMeta(
    'serverIp',
  );
  @override
  late final GeneratedColumn<String> serverIp = GeneratedColumn<String>(
    'server_ip',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('192.168.11.12'),
  );
  static const VerificationMeta _serverMqttPortMeta = const VerificationMeta(
    'serverMqttPort',
  );
  @override
  late final GeneratedColumn<int> serverMqttPort = GeneratedColumn<int>(
    'server_mqtt_port',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1883),
  );
  static const VerificationMeta _serverMqttIdMeta = const VerificationMeta(
    'serverMqttId',
  );
  @override
  late final GeneratedColumn<String> serverMqttId = GeneratedColumn<String>(
    'server_mqtt_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('mdk'),
  );
  static const VerificationMeta _serverMqttPasswordMeta =
      const VerificationMeta('serverMqttPassword');
  @override
  late final GeneratedColumn<String> serverMqttPassword =
      GeneratedColumn<String>(
        'server_mqtt_password',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('12344321'),
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    deviceId,
    wifiName,
    serverIp,
    serverMqttPort,
    serverMqttId,
    serverMqttPassword,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'basic_info';
  @override
  VerificationContext validateIntegrity(
    Insertable<BasicInfoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('wifi_name')) {
      context.handle(
        _wifiNameMeta,
        wifiName.isAcceptableOrUnknown(data['wifi_name']!, _wifiNameMeta),
      );
    }
    if (data.containsKey('server_ip')) {
      context.handle(
        _serverIpMeta,
        serverIp.isAcceptableOrUnknown(data['server_ip']!, _serverIpMeta),
      );
    }
    if (data.containsKey('server_mqtt_port')) {
      context.handle(
        _serverMqttPortMeta,
        serverMqttPort.isAcceptableOrUnknown(
          data['server_mqtt_port']!,
          _serverMqttPortMeta,
        ),
      );
    }
    if (data.containsKey('server_mqtt_id')) {
      context.handle(
        _serverMqttIdMeta,
        serverMqttId.isAcceptableOrUnknown(
          data['server_mqtt_id']!,
          _serverMqttIdMeta,
        ),
      );
    }
    if (data.containsKey('server_mqtt_password')) {
      context.handle(
        _serverMqttPasswordMeta,
        serverMqttPassword.isAcceptableOrUnknown(
          data['server_mqtt_password']!,
          _serverMqttPasswordMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BasicInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BasicInfoData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      deviceId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}device_id'],
          )!,
      wifiName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wifi_name'],
      ),
      serverIp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}server_ip'],
          )!,
      serverMqttPort:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}server_mqtt_port'],
          )!,
      serverMqttId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}server_mqtt_id'],
          )!,
      serverMqttPassword:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}server_mqtt_password'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $BasicInfoTable createAlias(String alias) {
    return $BasicInfoTable(attachedDatabase, alias);
  }
}

class BasicInfoData extends DataClass implements Insertable<BasicInfoData> {
  /// 0. 아이디
  final int id;

  /// 1. 디바이스 정보
  final String deviceId;
  final String? wifiName;

  /// 2. 서버
  final String serverIp;
  final int serverMqttPort;
  final String serverMqttId;
  final String serverMqttPassword;

  /// 3. 생성일
  final DateTime createdAt;
  const BasicInfoData({
    required this.id,
    required this.deviceId,
    this.wifiName,
    required this.serverIp,
    required this.serverMqttPort,
    required this.serverMqttId,
    required this.serverMqttPassword,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || wifiName != null) {
      map['wifi_name'] = Variable<String>(wifiName);
    }
    map['server_ip'] = Variable<String>(serverIp);
    map['server_mqtt_port'] = Variable<int>(serverMqttPort);
    map['server_mqtt_id'] = Variable<String>(serverMqttId);
    map['server_mqtt_password'] = Variable<String>(serverMqttPassword);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BasicInfoCompanion toCompanion(bool nullToAbsent) {
    return BasicInfoCompanion(
      id: Value(id),
      deviceId: Value(deviceId),
      wifiName:
          wifiName == null && nullToAbsent
              ? const Value.absent()
              : Value(wifiName),
      serverIp: Value(serverIp),
      serverMqttPort: Value(serverMqttPort),
      serverMqttId: Value(serverMqttId),
      serverMqttPassword: Value(serverMqttPassword),
      createdAt: Value(createdAt),
    );
  }

  factory BasicInfoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BasicInfoData(
      id: serializer.fromJson<int>(json['id']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      wifiName: serializer.fromJson<String?>(json['wifiName']),
      serverIp: serializer.fromJson<String>(json['serverIp']),
      serverMqttPort: serializer.fromJson<int>(json['serverMqttPort']),
      serverMqttId: serializer.fromJson<String>(json['serverMqttId']),
      serverMqttPassword: serializer.fromJson<String>(
        json['serverMqttPassword'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deviceId': serializer.toJson<String>(deviceId),
      'wifiName': serializer.toJson<String?>(wifiName),
      'serverIp': serializer.toJson<String>(serverIp),
      'serverMqttPort': serializer.toJson<int>(serverMqttPort),
      'serverMqttId': serializer.toJson<String>(serverMqttId),
      'serverMqttPassword': serializer.toJson<String>(serverMqttPassword),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BasicInfoData copyWith({
    int? id,
    String? deviceId,
    Value<String?> wifiName = const Value.absent(),
    String? serverIp,
    int? serverMqttPort,
    String? serverMqttId,
    String? serverMqttPassword,
    DateTime? createdAt,
  }) => BasicInfoData(
    id: id ?? this.id,
    deviceId: deviceId ?? this.deviceId,
    wifiName: wifiName.present ? wifiName.value : this.wifiName,
    serverIp: serverIp ?? this.serverIp,
    serverMqttPort: serverMqttPort ?? this.serverMqttPort,
    serverMqttId: serverMqttId ?? this.serverMqttId,
    serverMqttPassword: serverMqttPassword ?? this.serverMqttPassword,
    createdAt: createdAt ?? this.createdAt,
  );
  BasicInfoData copyWithCompanion(BasicInfoCompanion data) {
    return BasicInfoData(
      id: data.id.present ? data.id.value : this.id,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      wifiName: data.wifiName.present ? data.wifiName.value : this.wifiName,
      serverIp: data.serverIp.present ? data.serverIp.value : this.serverIp,
      serverMqttPort:
          data.serverMqttPort.present
              ? data.serverMqttPort.value
              : this.serverMqttPort,
      serverMqttId:
          data.serverMqttId.present
              ? data.serverMqttId.value
              : this.serverMqttId,
      serverMqttPassword:
          data.serverMqttPassword.present
              ? data.serverMqttPassword.value
              : this.serverMqttPassword,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BasicInfoData(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('wifiName: $wifiName, ')
          ..write('serverIp: $serverIp, ')
          ..write('serverMqttPort: $serverMqttPort, ')
          ..write('serverMqttId: $serverMqttId, ')
          ..write('serverMqttPassword: $serverMqttPassword, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    deviceId,
    wifiName,
    serverIp,
    serverMqttPort,
    serverMqttId,
    serverMqttPassword,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BasicInfoData &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.wifiName == this.wifiName &&
          other.serverIp == this.serverIp &&
          other.serverMqttPort == this.serverMqttPort &&
          other.serverMqttId == this.serverMqttId &&
          other.serverMqttPassword == this.serverMqttPassword &&
          other.createdAt == this.createdAt);
}

class BasicInfoCompanion extends UpdateCompanion<BasicInfoData> {
  final Value<int> id;
  final Value<String> deviceId;
  final Value<String?> wifiName;
  final Value<String> serverIp;
  final Value<int> serverMqttPort;
  final Value<String> serverMqttId;
  final Value<String> serverMqttPassword;
  final Value<DateTime> createdAt;
  const BasicInfoCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.wifiName = const Value.absent(),
    this.serverIp = const Value.absent(),
    this.serverMqttPort = const Value.absent(),
    this.serverMqttId = const Value.absent(),
    this.serverMqttPassword = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BasicInfoCompanion.insert({
    this.id = const Value.absent(),
    required String deviceId,
    this.wifiName = const Value.absent(),
    this.serverIp = const Value.absent(),
    this.serverMqttPort = const Value.absent(),
    this.serverMqttId = const Value.absent(),
    this.serverMqttPassword = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : deviceId = Value(deviceId);
  static Insertable<BasicInfoData> custom({
    Expression<int>? id,
    Expression<String>? deviceId,
    Expression<String>? wifiName,
    Expression<String>? serverIp,
    Expression<int>? serverMqttPort,
    Expression<String>? serverMqttId,
    Expression<String>? serverMqttPassword,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (wifiName != null) 'wifi_name': wifiName,
      if (serverIp != null) 'server_ip': serverIp,
      if (serverMqttPort != null) 'server_mqtt_port': serverMqttPort,
      if (serverMqttId != null) 'server_mqtt_id': serverMqttId,
      if (serverMqttPassword != null)
        'server_mqtt_password': serverMqttPassword,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BasicInfoCompanion copyWith({
    Value<int>? id,
    Value<String>? deviceId,
    Value<String?>? wifiName,
    Value<String>? serverIp,
    Value<int>? serverMqttPort,
    Value<String>? serverMqttId,
    Value<String>? serverMqttPassword,
    Value<DateTime>? createdAt,
  }) {
    return BasicInfoCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      wifiName: wifiName ?? this.wifiName,
      serverIp: serverIp ?? this.serverIp,
      serverMqttPort: serverMqttPort ?? this.serverMqttPort,
      serverMqttId: serverMqttId ?? this.serverMqttId,
      serverMqttPassword: serverMqttPassword ?? this.serverMqttPassword,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (wifiName.present) {
      map['wifi_name'] = Variable<String>(wifiName.value);
    }
    if (serverIp.present) {
      map['server_ip'] = Variable<String>(serverIp.value);
    }
    if (serverMqttPort.present) {
      map['server_mqtt_port'] = Variable<int>(serverMqttPort.value);
    }
    if (serverMqttId.present) {
      map['server_mqtt_id'] = Variable<String>(serverMqttId.value);
    }
    if (serverMqttPassword.present) {
      map['server_mqtt_password'] = Variable<String>(serverMqttPassword.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BasicInfoCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('wifiName: $wifiName, ')
          ..write('serverIp: $serverIp, ')
          ..write('serverMqttPort: $serverMqttPort, ')
          ..write('serverMqttId: $serverMqttId, ')
          ..write('serverMqttPassword: $serverMqttPassword, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BasicInfoTable basicInfo = $BasicInfoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [basicInfo];
}

typedef $$BasicInfoTableCreateCompanionBuilder =
    BasicInfoCompanion Function({
      Value<int> id,
      required String deviceId,
      Value<String?> wifiName,
      Value<String> serverIp,
      Value<int> serverMqttPort,
      Value<String> serverMqttId,
      Value<String> serverMqttPassword,
      Value<DateTime> createdAt,
    });
typedef $$BasicInfoTableUpdateCompanionBuilder =
    BasicInfoCompanion Function({
      Value<int> id,
      Value<String> deviceId,
      Value<String?> wifiName,
      Value<String> serverIp,
      Value<int> serverMqttPort,
      Value<String> serverMqttId,
      Value<String> serverMqttPassword,
      Value<DateTime> createdAt,
    });

class $$BasicInfoTableFilterComposer
    extends Composer<_$AppDatabase, $BasicInfoTable> {
  $$BasicInfoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wifiName => $composableBuilder(
    column: $table.wifiName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverIp => $composableBuilder(
    column: $table.serverIp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverMqttPort => $composableBuilder(
    column: $table.serverMqttPort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverMqttId => $composableBuilder(
    column: $table.serverMqttId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverMqttPassword => $composableBuilder(
    column: $table.serverMqttPassword,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BasicInfoTableOrderingComposer
    extends Composer<_$AppDatabase, $BasicInfoTable> {
  $$BasicInfoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wifiName => $composableBuilder(
    column: $table.wifiName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverIp => $composableBuilder(
    column: $table.serverIp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverMqttPort => $composableBuilder(
    column: $table.serverMqttPort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverMqttId => $composableBuilder(
    column: $table.serverMqttId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverMqttPassword => $composableBuilder(
    column: $table.serverMqttPassword,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BasicInfoTableAnnotationComposer
    extends Composer<_$AppDatabase, $BasicInfoTable> {
  $$BasicInfoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<String> get wifiName =>
      $composableBuilder(column: $table.wifiName, builder: (column) => column);

  GeneratedColumn<String> get serverIp =>
      $composableBuilder(column: $table.serverIp, builder: (column) => column);

  GeneratedColumn<int> get serverMqttPort => $composableBuilder(
    column: $table.serverMqttPort,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serverMqttId => $composableBuilder(
    column: $table.serverMqttId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serverMqttPassword => $composableBuilder(
    column: $table.serverMqttPassword,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BasicInfoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BasicInfoTable,
          BasicInfoData,
          $$BasicInfoTableFilterComposer,
          $$BasicInfoTableOrderingComposer,
          $$BasicInfoTableAnnotationComposer,
          $$BasicInfoTableCreateCompanionBuilder,
          $$BasicInfoTableUpdateCompanionBuilder,
          (
            BasicInfoData,
            BaseReferences<_$AppDatabase, $BasicInfoTable, BasicInfoData>,
          ),
          BasicInfoData,
          PrefetchHooks Function()
        > {
  $$BasicInfoTableTableManager(_$AppDatabase db, $BasicInfoTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$BasicInfoTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$BasicInfoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$BasicInfoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<String?> wifiName = const Value.absent(),
                Value<String> serverIp = const Value.absent(),
                Value<int> serverMqttPort = const Value.absent(),
                Value<String> serverMqttId = const Value.absent(),
                Value<String> serverMqttPassword = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BasicInfoCompanion(
                id: id,
                deviceId: deviceId,
                wifiName: wifiName,
                serverIp: serverIp,
                serverMqttPort: serverMqttPort,
                serverMqttId: serverMqttId,
                serverMqttPassword: serverMqttPassword,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String deviceId,
                Value<String?> wifiName = const Value.absent(),
                Value<String> serverIp = const Value.absent(),
                Value<int> serverMqttPort = const Value.absent(),
                Value<String> serverMqttId = const Value.absent(),
                Value<String> serverMqttPassword = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BasicInfoCompanion.insert(
                id: id,
                deviceId: deviceId,
                wifiName: wifiName,
                serverIp: serverIp,
                serverMqttPort: serverMqttPort,
                serverMqttId: serverMqttId,
                serverMqttPassword: serverMqttPassword,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BasicInfoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BasicInfoTable,
      BasicInfoData,
      $$BasicInfoTableFilterComposer,
      $$BasicInfoTableOrderingComposer,
      $$BasicInfoTableAnnotationComposer,
      $$BasicInfoTableCreateCompanionBuilder,
      $$BasicInfoTableUpdateCompanionBuilder,
      (
        BasicInfoData,
        BaseReferences<_$AppDatabase, $BasicInfoTable, BasicInfoData>,
      ),
      BasicInfoData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BasicInfoTableTableManager get basicInfo =>
      $$BasicInfoTableTableManager(_db, _db.basicInfo);
}
