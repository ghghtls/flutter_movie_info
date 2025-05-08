import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_movie_info/domain/usecases/get_now_playing_movies.dart';
import 'package:flutter_movie_info/domain/entities/movie.dart';
import 'package:flutter_movie_info/pages/homepage/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MockGetNowPlayingMovies extends Mock implements GetNowPlayingMovies {}

void main() {
  group('HomePageViewModel', () {
    late MockGetNowPlayingMovies mockUsecase;
    late HomePageViewModel viewModel;

    setUp(() {
      mockUsecase = MockGetNowPlayingMovies();
      viewModel = HomePageViewModel(mockUsecase);
    });

    test('초기 상태는 AsyncLoading 이어야 한다', () {
      expect(viewModel.debugState, const AsyncLoading<List<Movie>>());
    });

    test('loadMovies 호출 시 정상적으로 데이터를 가져와 AsyncData 상태가 된다', () async {
      // Arrange
      final mockMovies = [
        Movie(
          id: 1,
          title: 'Interstellar',
          posterPath: '/inter.jpg',
          voteAverage: 8.5,
        ),
      ];

      when(mockUsecase()).thenAnswer((_) async => mockMovies);

      // Act
      await viewModel.loadMovies();

      // Assert
      expect(viewModel.debugState, AsyncData(mockMovies));
    });

    test('loadMovies 중 오류 발생 시 AsyncError 상태가 된다', () async {
      when(mockUsecase()).thenThrow(Exception('API Error'));

      await viewModel.loadMovies();

      expect(viewModel.debugState.hasError, true);
    });
  });
}
