import 'package:flutter/material.dart';
import 'package:flymovies/daos/database.dart';
import 'package:flymovies/models/user.dart';
import 'package:flymovies/pages/splash_page.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // final database =
  //     await $FloorAppDatabase.databaseBuilder('flymovies.db').build();

  // final userDao = database.userDao;
  // final user = User(
  //     name: 'FlyMovies', email: 'flymovies@gmail.com', password: 'flymovies');

  // await userDao.insertUser(user);

  runApp(const FlyMoviesApp());
}

class FlyMoviesApp extends StatelessWidget {
  const FlyMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlyMovies App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
