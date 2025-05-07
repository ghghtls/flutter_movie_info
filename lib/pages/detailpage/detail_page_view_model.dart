import 'package:flutter_movie_info/provider/usecase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_info/domain/entities/movie_detail.dart';
import 'package:flutter_movie_info/domain/usecases/get_movie_detail.dart';

class DetailViewModel extends StateNotifier<AsyncValue<MovieDetail>> {
  final GetMovieDetail getMovieDetail;

  DetailViewModel(this.getMovieDetail, int movieId)
    : super(const AsyncLoading()) {
    _fetch(movieId);
  }

  Future<void> _fetch(int id) async {
    try {
      final detail = await getMovieDetail(id);
      state = AsyncData(detail);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final detailViewModelProvider =
    StateNotifierProvider.family<DetailViewModel, AsyncValue<MovieDetail>, int>(
      (ref, movieId) {
        final usecase = ref.watch(getMovieDetailProvider);
        return DetailViewModel(usecase, movieId);
      },
    );
