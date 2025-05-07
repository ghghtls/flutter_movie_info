import 'package:flutter_movie_info/domain/repositories/movie_repository.dart';

import '../entities/movie.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<List<Movie>> call() => repository.getNowPlayingMovies();
}
