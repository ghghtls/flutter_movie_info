import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_movie_info/data/datasources/movie_api.dart';
import 'package:flutter_movie_info/data/dto/movie_response_dto.dart';

// mockito 자동 생성 안 쓸 때:
class MockClient extends Mock implements http.Client {}

void main() {
  group('MovieApi', () {
    late MovieApi api;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      api = MovieApi(client: mockClient);
    });

    test('fetchNowPlaying() returns MovieResponseDto on success', () async {
      // Arrange
      final mockJson = {
        "page": 1,
        "results": [
          {
            "id": 1,
            "title": "Test Movie",
            "overview": "Description",
            "poster_path": "/poster.jpg",
            "backdrop_path": "/backdrop.jpg",
            "vote_average": 7.8,
            "release_date": "2023-01-01",
          },
        ],
        "total_pages": 1,
        "total_results": 1,
      };

      when(
        mockClient.get(
          Uri.parse(
            'https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1',
          ),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(mockJson), 200));

      // Act
      final result = await api.fetchNowPlaying();

      // Assert
      expect(result, isA<MovieResponseDto>());
      expect(result.results.first.title, "Test Movie");
    });

    test('fetchNowPlaying() throws Exception on failure', () async {
      when(
        mockClient.get(
          Uri.parse(
            'https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1',
          ),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response("Error", 500));

      expect(() => api.fetchNowPlaying(), throwsException);
    });
  });
}
