import 'package:flutter_movie_info/data/datasources/movie_api.dart';
import 'package:flutter_movie_info/data/repositories/movie_repository_impl.dart';
import 'package:flutter_movie_info/pages/homepage/widgets/movie_category.dart';
import 'package:flutter_movie_info/provider/usecase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_now_playing_movies.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
import '../../domain/usecases/get_upcoming_movies.dart';

final movieProviderByCategory =
    Provider.family<FutureProvider<List<Movie>>, MovieCategory>((
      ref,
      category,
    ) {
      switch (category) {
        case MovieCategory.nowPlaying:
          return nowPlayingMoviesProvider;
        case MovieCategory.popular:
          return popularMoviesProvider;
        case MovieCategory.topRated:
          return topRatedMoviesProvider;
        case MovieCategory.upcoming:
          return upcomingMoviesProvider;
      }
    });

final nowPlayingMoviesProvider = FutureProvider<List<Movie>>((ref) {
  final usecase = ref.watch(getNowPlayingMoviesProvider);
  return usecase();
});

final popularMoviesProvider = FutureProvider<List<Movie>>((ref) {
  final usecase = ref.watch(getPopularMoviesProvider);

  return usecase();
});

final topRatedMoviesProvider = FutureProvider<List<Movie>>((ref) {
  final usecase = ref.watch(getTopRatedMoviesProvider);

  return usecase();
});

final upcomingMoviesProvider = FutureProvider<List<Movie>>((ref) {
  final usecase = ref.watch(getUpcomingMoviesProvider);
  return usecase();
});

final getPopularMoviesProvider = Provider<GetPopularMovies>((ref) {
  final api = MovieApi();
  final repo = MovieRepositoryImpl(api);
  return GetPopularMovies(repo);
});
