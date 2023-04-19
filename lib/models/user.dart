import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String? name, email, password;

  User({this.name, this.email, this.password});
}
