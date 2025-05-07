import 'package:flutter_movie_info/domain/entities/movie_detail.dart';
import 'package:flutter_movie_info/domain/repositories/movie_repository.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<MovieDetail> call(int id) => repository.getMovieDetail(id);
}
