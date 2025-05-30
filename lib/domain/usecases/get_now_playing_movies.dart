import 'package:flutter_movie_info/domain/entities/movie.dart';
import 'package:flutter_movie_info/domain/repositories/movie_repository.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<List<Movie>> call() => repository.getNowPlaying();
}
