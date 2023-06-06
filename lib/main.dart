import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flymovies/daos/database.dart';
import 'package:flymovies/pages/splash_page.dart';
import 'package:flymovies/utils/utils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final callback = Callback(
    onCreate: (database, version) {
      // inserts padrões
      database.execute(
          "insert into user(name, email, password) values('FlyMovies','flymovies@gmail.com','flymovies')");
      database.execute(
          "insert into setting(color, height, width) values(1000, 100, 100)");
    },
  );

  //abre uma conexão com o banco de dados
  //se o banco de dados não existir, cria
  final database = await $FloorAppDatabase
      .databaseBuilder('flymovies.db')
      .addCallback(callback)
      .build();

  database.close;

  runApp(FlyMoviesApp(prefs: prefs));
}

class FlyMoviesApp extends StatelessWidget {
  const FlyMoviesApp({super.key, this.prefs});
  final prefs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'FlyMovies App',
        theme: ThemeData(
            primarySwatch: Utils.createMaterialColor(
                Color(prefs.getInt('color') ?? Colors.green.value))),
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales);
  }
}
