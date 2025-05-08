import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_movie_info/domain/usecases/get_movie_detail.dart';
import 'package:flutter_movie_info/domain/entities/movie_detail.dart';
import 'package:flutter_movie_info/domain/entities/movie.dart';
import 'package:flutter_movie_info/pages/detailpage/detail_page_view_model.dart';

class MockGetMovieDetail extends Mock implements GetMovieDetail {}

void main() {
  group('DetailViewModel', () {
    late MockGetMovieDetail mockUsecase;
    late DetailViewModel viewModel;

    setUp(() {
      mockUsecase = MockGetMovieDetail();
      viewModel = DetailViewModel(mockUsecase, 1);
    });

    test('초기 상태는 AsyncLoading 이어야 한다', () {
      expect(viewModel.debugState, const AsyncLoading<MovieDetail>());
    });

    test('정상 데이터 수신 시 AsyncData 상태가 된다', () async {
      final mockDetail = MovieDetail(
        id: 1,
        title: 'Inception',
        overview: 'Dream within a dream',
        posterPath: '/poster.jpg',
        releaseDate: '2010-07-16',
        runtime: 148,
        voteAverage: 8.8,
        genres: ['Action', 'Sci-Fi'],
        productionCompanies: [],
      );

      when(mockUsecase(1)).thenAnswer((_) async => mockDetail);

      await Future.delayed(
        const Duration(milliseconds: 100),
      ); // StateNotifier init delay

      expect(viewModel.debugState, AsyncData(mockDetail));
    });

    test('에러 발생 시 AsyncError 상태가 된다', () async {
      when(mockUsecase(1)).thenThrow(Exception('Fetch failed'));

      await Future.delayed(const Duration(milliseconds: 100));

      expect(viewModel.debugState.hasError, true);
    });
  });
}
