// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  SettingDao? _settingDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `email` TEXT, `password` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Setting` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `color` INTEGER, `height` INTEGER, `width` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  SettingDao get settingDao {
    return _settingDaoInstance ??= _$SettingDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  @override
  Future<List<User>> findAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => User(
            name: row['name'] as String?,
            email: row['email'] as String?,
            password: row['password'] as String?));
  }

  @override
  Future<List<String>> findAllUsersName() async {
    return _queryAdapter.queryList('SELECT name FROM User',
        mapper: (Map<String, Object?> row) => row.values.first as String);
  }

  @override
  Future<User?> findUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => User(
            name: row['name'] as String?,
            email: row['email'] as String?,
            password: row['password'] as String?),
        arguments: [id]);
  }

  @override
  Future<User?> findUserByEmail(String email) async {
    return _queryAdapter.query('SELECT * FROM User WHERE email = ?1',
        mapper: (Map<String, Object?> row) => User(
            name: row['name'] as String?,
            email: row['email'] as String?,
            password: row['password'] as String?),
        arguments: [email]);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }
}

class _$SettingDao extends SettingDao {
  _$SettingDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _settingInsertionAdapter = InsertionAdapter(
            database,
            'Setting',
            (Setting item) => <String, Object?>{
                  'id': item.id,
                  'color': item.color,
                  'height': item.height,
                  'width': item.width
                }),
        _settingUpdateAdapter = UpdateAdapter(
            database,
            'Setting',
            ['id'],
            (Setting item) => <String, Object?>{
                  'id': item.id,
                  'color': item.color,
                  'height': item.height,
                  'width': item.width
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Setting> _settingInsertionAdapter;

  final UpdateAdapter<Setting> _settingUpdateAdapter;

  @override
  Future<List<Setting>> findAllSettings() async {
    return _queryAdapter.queryList('SELECT * FROM Setting',
        mapper: (Map<String, Object?> row) => Setting(
            color: row['color'] as int?,
            height: row['height'] as int?,
            width: row['width'] as int?));
  }

  @override
  Future<Setting?> findSettingById(int id) async {
    return _queryAdapter.query('SELECT * FROM Setting WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Setting(
            color: row['color'] as int?,
            height: row['height'] as int?,
            width: row['width'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> insertSetting(Setting setting) async {
    await _settingInsertionAdapter.insert(setting, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSetting(Setting setting) async {
    await _settingUpdateAdapter.update(setting, OnConflictStrategy.abort);
  }
}
