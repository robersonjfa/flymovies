// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:flymovies/models/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Query('SELECT name FROM User')
  Future<List<String>> findAllUsersName();

  @Query('SELECT * FROM User WHERE id = :id')
  Future<User?> findUserById(int id);

  @Query('SELECT * FROM User WHERE email = :email')
  Future<User?> findUserByEmail(String email);

  @insert
  Future<void> insertUser(User user);
}
