// lib/provider/usecase_providers.dart
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
