import 'package:flutter_movie_info/domain/entities/movie.dart';
import 'package:flutter_movie_info/domain/entities/movie_detail.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getPopular();
  Future<List<Movie>> getTopRated();
  Future<List<Movie>> getUpcoming();
  Future<MovieDetail> getMovieDetail(int id);
}
