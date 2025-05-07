import 'package:flutter_movie_info/provider/usecase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_now_playing_movies.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomePageViewModel, AsyncValue<List<Movie>>>((ref) {
      final usecase = ref.watch(getNowPlayingMoviesProvider);
      return HomePageViewModel(usecase);
    });

class HomePageViewModel extends StateNotifier<AsyncValue<List<Movie>>> {
  final GetNowPlayingMovies usecase;

  HomePageViewModel(this.usecase) : super(const AsyncLoading()) {
    loadMovies();
  }

  Future<void> loadMovies() async {
    try {
      final movies = await usecase();
      state = AsyncData(movies);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
