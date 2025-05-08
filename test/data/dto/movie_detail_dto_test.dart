import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_info/data/dto/movie_detail_dto.dart';

void main() {
  group('MovieDetailDto', () {
    test('fromJson should parse correctly', () {
      final json = {
        "id": 10,
        "title": "Inception",
        "overview": "A mind-bending thriller",
        "poster_path": "/inception.jpg",
        "backdrop_path": "/bg.jpg",
        "vote_average": 8.8,
        "release_date": "2010-07-16",
        "runtime": 148,
        "genres": [
          {"id": 1, "name": "Action"},
          {"id": 2, "name": "Sci-Fi"},
        ],
        "production_companies": [
          {"name": "Warner Bros", "logo_path": "/wb.png"},
        ],
      };

      final dto = MovieDetailDto.fromJson(json);

      expect(dto.id, 10);
      expect(dto.title, "Inception");
      expect(dto.runtime, 148);
      expect(dto.genres.length, 2);
      expect(dto.genres.first['name'], "Action");
      expect(dto.productionCompanies.first['logo_path'], "/wb.png");
    });
  });
}
