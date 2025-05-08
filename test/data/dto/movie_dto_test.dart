import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_info/data/dto/movie_response_dto.dart';

void main() {
  group('MovieDto', () {
    test('fromJson should parse correctly', () {
      final json = {
        "id": 1,
        "title": "Interstellar",
        "overview": "A space epic",
        "poster_path": "/abc123.jpg",
        "backdrop_path": "/def456.jpg",
        "vote_average": 8.6,
        "release_date": "2014-11-07",
      };

      final dto = MovieDto.fromJson(json);

      expect(dto.id, 1);
      expect(dto.title, "Interstellar");
      expect(dto.overview, "A space epic");
      expect(dto.posterPath, "/abc123.jpg");
      expect(dto.backdropPath, "/def456.jpg");
      expect(dto.voteAverage, 8.6);
      expect(dto.releaseDate, "2014-11-07");
    });
  });
}
