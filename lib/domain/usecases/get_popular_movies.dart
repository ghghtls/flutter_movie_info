import 'package:flutter_movie_info/domain/entities/movie.dart';
import 'package:flutter_movie_info/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<Movie>> call() {
    return repository.getPopular();
  }
}
