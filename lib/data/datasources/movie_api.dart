import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../dto/movie_response_dto.dart';
import '../dto/movie_detail_dto.dart';
import 'movie_data_source.dart';

class MovieApi implements MovieDataSource {
  final String _baseUrl = 'https://api.themoviedb.org/3';

  Map<String, String> get _headers => {
    'Authorization': 'Bearer ${dotenv.env['TMDB_BEARER_TOKEN']}',
    'Content-Type': 'application/json;charset=utf-8',
  };

  @override
  Future<MovieResponseDto> fetchNowPlaying() async {
    final url = Uri.parse('$_baseUrl/movie/now_playing?language=ko-KR&page=1');
    return _getMovieList(url);
  }

  @override
  Future<MovieResponseDto> fetchPopular() async {
    final url = Uri.parse('$_baseUrl/movie/popular?language=ko-KR&page=1');
    return _getMovieList(url);
  }

  @override
  Future<MovieResponseDto> fetchTopRated() async {
    final url = Uri.parse('$_baseUrl/movie/top_rated?language=ko-KR&page=1');
    return _getMovieList(url);
  }

  @override
  Future<MovieResponseDto> fetchUpcoming() async {
    final url = Uri.parse('$_baseUrl/movie/upcoming?language=ko-KR&page=1');
    return _getMovieList(url);
  }

  @override
  Future<MovieDetailDto> fetchMovieDetail(int movieId) async {
    final url = Uri.parse('$_baseUrl/movie/$movieId?language=ko-KR');
    final response = await http.get(url, headers: _headers);

    if (response.statusCode != 200) {
      throw Exception('상세 API 요청 실패: ${response.statusCode}');
    }

    final data = json.decode(response.body);
    return MovieDetailDto.fromJson(data);
  }

  Future<MovieResponseDto> _getMovieList(Uri url) async {
    final response = await http.get(url, headers: _headers);
    if (response.statusCode != 200) {
      throw Exception('목록 API 요청 실패: ${response.statusCode}');
    }

    final data = json.decode(response.body);
    return MovieResponseDto.fromJson(data);
  }
}
