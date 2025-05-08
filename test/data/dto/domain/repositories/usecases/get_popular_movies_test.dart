import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_movie_info/domain/entities/movie.dart';
import 'package:flutter_movie_info/domain/repositories/movie_repository.dart';
import 'package:flutter_movie_info/domain/usecases/get_popular_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  group('GetPopularMovies UseCase', () {
    late MockMovieRepository mockRepository;
    late GetPopularMovies usecase;

    setUp(() {
      mockRepository = MockMovieRepository();
      usecase = GetPopularMovies(mockRepository);
    });

    test('call() should return list of Movie from repository', () async {
      // Arrange
      final mockMovies = [
        Movie(
          id: 1,
          title: 'Inception',
          posterPath: '/inception.jpg',
          voteAverage: 8.5,
        ),
        Movie(id: 2, title: 'Batman', posterPath: '/bat.jpg', voteAverage: 8.1),
      ];

      when(mockRepository.getPopular()).thenAnswer((_) async => mockMovies);

      // Act
      final result = await usecase();

      // Assert
      expect(result, isA<List<Movie>>());
      expect(result.length, 2);
      expect(result.first.title, 'Inception');
    });
  });
}
