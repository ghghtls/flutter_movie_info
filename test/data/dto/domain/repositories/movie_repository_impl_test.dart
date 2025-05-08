import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_movie_info/domain/repositories/movie_repository.dart';
import 'package:flutter_movie_info/data/repositories/movie_repository_impl.dart';
import 'package:flutter_movie_info/data/datasources/movie_data_source.dart';
import 'package:flutter_movie_info/data/dto/movie_response_dto.dart';
import 'package:flutter_movie_info/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_info/domain/entities/movie.dart';
import 'package:flutter_movie_info/domain/entities/movie_detail.dart';

class MockDataSource extends Mock implements MovieDataSource {}

void main() {
  group('MovieRepositoryImpl', () {
    late MovieRepository repository;
    late MockDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockDataSource();
      repository = MovieRepositoryImpl(mockDataSource);
    });

    test('getNowPlaying() returns list of Movie entities', () async {
      // Arrange
      final dto = MovieResponseDto(
        page: 1,
        results: [
          MovieDto(
            id: 1,
            title: 'Batman',
            overview: 'Gotham hero',
            posterPath: '/bat.jpg',
            backdropPath: '/bg.jpg',
            voteAverage: 8.1,
            releaseDate: '2023-01-01',
          ),
        ],
        totalPages: 1,
        totalResults: 1,
      );

      when(mockDataSource.fetchNowPlaying()).thenAnswer((_) async => dto);

      // Act
      final result = await repository.getNowPlaying();

      // Assert
      expect(result, isA<List<Movie>>());
      expect(result.first.title, 'Batman');
    });

    test('getMovieDetail() returns a MovieDetail entity', () async {
      final dto = MovieDetailDto(
        id: 1,
        title: 'Batman',
        overview: 'Dark Knight',
        posterPath: '/bat.jpg',
        backdropPath: '/bg.jpg',
        voteAverage: 8.5,
        releaseDate: '2023-01-01',
        runtime: 120,
        genres: [
          {'id': 1, 'name': 'Action'},
        ],
        productionCompanies: [
          {'name': 'DC', 'logo_path': '/dc.png'},
        ],
      );

      when(mockDataSource.fetchMovieDetail(1)).thenAnswer((_) async => dto);

      final result = await repository.getMovieDetail(1);

      expect(result, isA<MovieDetail>());
      expect(result.title, 'Batman');
      expect(result.genres.first, 'Action');
    });
  });
}
