import 'package:floor/floor.dart';

@entity
class Setting {
  @PrimaryKey(autoGenerate: true)
  int? id;

  int? color, height, width;

  Setting({this.color, this.height, this.width});
}
