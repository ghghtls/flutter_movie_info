// lib/provider/usecase_providers.dart
import 'package:flutter_movie_info/domain/usecases/get_movie_detail.dart';
import 'package:flutter_movie_info/domain/usecases/get_popular_movies.dart';
import 'package:flutter_movie_info/domain/usecases/get_top_rated_movies.dart';
import 'package:flutter_movie_info/domain/usecases/get_upcoming_movies.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_now_playing_movies.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../data/datasources/movie_api.dart';

// API, Repository, UseCase 연결
final getNowPlayingMoviesProvider = Provider<GetNowPlayingMovies>((ref) {
  final api = MovieApi(); // API 클래스
  final repo = MovieRepositoryImpl(api); // Repository 구현체
  return GetNowPlayingMovies(repo); // UseCase 리턴
});

final getMovieDetailProvider = Provider<GetMovieDetail>((ref) {
  final api = MovieApi(); // API 구현체
  final repo = MovieRepositoryImpl(api); // MovieRepository 구현체
  return GetMovieDetail(repo); // UseCase 인스턴스 리턴
});

// 인기 영화
final getPopularMoviesProvider = Provider<GetPopularMovies>((ref) {
  final api = MovieApi();
  final repo = MovieRepositoryImpl(api);
  return GetPopularMovies(repo);
});

// 평점 높은 영화
final getTopRatedMoviesProvider = Provider<GetTopRatedMovies>((ref) {
  final api = MovieApi();
  final repo = MovieRepositoryImpl(api);
  return GetTopRatedMovies(repo);
});

// 개봉 예정 영화
final getUpcomingMoviesProvider = Provider<GetUpcomingMovies>((ref) {
  final api = MovieApi();
  final repo = MovieRepositoryImpl(api);
  return GetUpcomingMovies(repo);
});
