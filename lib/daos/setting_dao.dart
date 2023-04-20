import 'package:floor/floor.dart';
import 'package:flymovies/models/setting.dart';

@dao
abstract class SettingDao {
  @Query('SELECT * FROM Setting')
  Future<List<Setting>> findAllSettings();

  @Query('SELECT * FROM Setting WHERE id = :id')
  Future<Setting?> findSettingById(int id);

  @insert
  Future<void> insertSetting(Setting setting);

  @update
  Future<void> updateSetting(Setting setting);
}
