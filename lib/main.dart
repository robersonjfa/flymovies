import 'package:flutter/material.dart';
import 'package:flymovies/pages/main_page.dart';

void main() {
  runApp(const FlyMoviesApp());
}

class FlyMoviesApp extends StatelessWidget {
  const FlyMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlyMovies App',
        theme: ThemeData(primarySwatch: Colors.green),
        home: const MainPage(title: 'FlyMovies App'));
  }
}
