import 'package:flutter_test/flutter_test.dart';
import 'package:flymovies/models/movie.dart';
import 'package:flymovies/models/user.dart';
import 'package:flymovies/pages/main_page.dart';
import 'package:flymovies/utils/utils.dart';

void main() {
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

    testWidgets('MyWidget has a title', (tester) async {
      final user = User(
          name: 'teste',
          email: 'teste',
          password:
              'teste'); // Create the widget by telling the tester to build it.
      await tester.pumpWidget(MainPage(title: 'Tela principal', user: user));

      final titleFinder = find.text('Tela principal');

      expect(titleFinder, findsOneWidget);
    });
  });
}
