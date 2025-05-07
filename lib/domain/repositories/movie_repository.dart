// lib/domain/repositories/movie_repository.dart
import '../entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlayingMovies();
}
