import 'dart:convert';
import 'package:flymovies/services/api.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TmdbService {
  final jsonEncoder = const JsonEncoder();
  late final tmdb;

  TmdbService() {
    tmdb = TMDB(
      ApiKeys(Api.apiKey, 'apiReadAccessTokenv4'),
      logConfig: const ConfigLogger(
        showLogs: true, //must be true than only all other logs will be shown
        showErrorLogs: true,
      ),
    );
  }

  getMovies() async {
    var tmdbResult = await tmdb.v3.movies.getPopular();
    var jsonResult = json.decode(jsonEncoder.convert(tmdbResult))['results'];
    return jsonResult;
  }
}
