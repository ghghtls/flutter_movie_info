import 'dart:convert';
import 'package:flutter_movie_info/data/datasources/movie_data_source.dart';
import 'package:flutter_movie_info/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_info/data/dto/movie_response_dto.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final String baseUrl = 'https://api.themoviedb.org/3/movie';
  final Map<String, String> headers = {
    'Authorization': 'Bearer ${dotenv.env['TMDB_BEARER_TOKEN']}',
  };

  @override
  Future<MovieResponseDto> fetchNowPlaying() async {
    final res = await http.get(
      Uri.parse('$baseUrl/now_playing?language=ko-KR'),
      headers: headers,
    );
    return MovieResponseDto.fromJson(jsonDecode(res.body));
  }

  @override
  Future<MovieResponseDto> fetchPopular() async {
    final res = await http.get(
      Uri.parse('$baseUrl/popular?language=ko-KR'),
      headers: headers,
    );
    return MovieResponseDto.fromJson(jsonDecode(res.body));
  }

  @override
  Future<MovieResponseDto> fetchTopRated() async {
    final res = await http.get(
      Uri.parse('$baseUrl/top_rated?language=ko-KR'),
      headers: headers,
    );
    return MovieResponseDto.fromJson(jsonDecode(res.body));
  }

  @override
  Future<MovieResponseDto> fetchUpcoming() async {
    final res = await http.get(
      Uri.parse('$baseUrl/upcoming?language=ko-KR'),
      headers: headers,
    );
    return MovieResponseDto.fromJson(jsonDecode(res.body));
  }

  @override
  Future<MovieDetailDto> fetchMovieDetail(int movieId) async {
    final res = await http.get(
      Uri.parse('$baseUrl/$movieId?language=ko-KR'),
      headers: headers,
    );
    return MovieDetailDto.fromJson(jsonDecode(res.body));
  }
}
