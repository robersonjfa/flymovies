import 'package:flutter/material.dart';

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
