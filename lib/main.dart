import 'package:flutter/material.dart';
import 'package:flymovies/pages/splashpage.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  runApp(const FlyMoviesApp());
}

class FlyMoviesApp extends StatelessWidget {
  const FlyMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlyMovies App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
