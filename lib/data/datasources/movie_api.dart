import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../dto/movie_dto.dart';

class MovieApi {
  final String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<MovieDto>> fetchNowPlayingMovies() async {
    final token = dotenv.env['TMDB_BEARER_TOKEN'];
    if (token == null) throw Exception('TMDB_BEARER_TOKEN가 .env에 없음');

    final url = Uri.parse('$_baseUrl/movie/now_playing?language=ko-KR&page=1');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('API 요청 실패: ${response.statusCode}');
    }

    final data = json.decode(response.body);
    final List results = data['results'];

    return results.map((e) => MovieDto.fromJson(e)).toList();
  }
}
