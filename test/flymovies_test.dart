import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flymovies/models/movie.dart';
import 'package:flymovies/pages/settings_page.dart';
import 'package:flymovies/utils/utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlyMovies Test', () {
    test('Test utils genres', () {
      Movie movie = Movie(
          id: 1,
          title: 'teste',
          posterPath: '',
          backdropPath: '',
          overview: '',
          releaseDate: '',
          voteAverage: 0,
          genreIds: [28, 12]);

      var genres = Utils.getGenres(movie);
      expect(genres, 'Action, Adventure');
    });

    testWidgets('MyWidget has a widget', (tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: SettingsPage())));
      //await tester.pumpWidget(const SplashPage());
      final hasIndicator = find.byType(SingleChildScrollView);

      expect(hasIndicator, findsOneWidget);
    });
  });
}
