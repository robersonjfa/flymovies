import 'package:flutter/material.dart';
import 'package:flymovies/daos/database.dart';
import 'package:flymovies/models/setting.dart';
import 'package:flymovies/models/user.dart';
import 'package:flymovies/pages/splash_page.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // abre uma conexão com o banco de dados
  // se o banco de dados não existir, cria
  // final database =
  //     await $FloorAppDatabase.databaseBuilder('flymovies.db').build();

  // // cria o dao do usuário
  // final userDao = database.userDao;
  // final user = User(
  //     name: 'FlyMovies', email: 'flymovies@gmail.com', password: 'flymovies');
  // await userDao.insertUser(user);

  // cria o dao de configuração(setting)
  // final settingDao = database.settingDao;
  // final setting = Setting(color: 1000, height: 100, width: 100);
  // await settingDao.insertSetting(setting);

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
