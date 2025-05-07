import 'package:flutter_movie_info/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_info/data/dto/movie_response_dto.dart';

abstract class MovieDataSource {
  Future<MovieResponseDto> fetchNowPlaying();
  Future<MovieResponseDto> fetchPopular();
  Future<MovieResponseDto> fetchTopRated();
  Future<MovieResponseDto> fetchUpcoming();
  Future<MovieDetailDto> fetchMovieDetail(int movieId);
}
