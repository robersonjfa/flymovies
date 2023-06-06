import 'dart:async';
import 'dart:ffi';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'user_dao.dart';
import 'setting_dao.dart';
import 'package:flymovies/models/user.dart';
import 'package:flymovies/models/setting.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [User, Setting])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  SettingDao get settingDao;
}
