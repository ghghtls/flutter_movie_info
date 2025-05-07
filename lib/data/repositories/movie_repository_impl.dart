import 'package:flutter_movie_info/domain/repositories/movie_repository.dart';

import '../../domain/entities/movie.dart';
import '../datasources/movie_api.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi api;

  MovieRepositoryImpl(this.api);

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final dtoList = await api.fetchNowPlayingMovies();
    return dtoList
        .map(
          (dto) => Movie(
            id: dto.id,
            title: dto.title,
            posterUrl: 'https://image.tmdb.org/t/p/w500${dto.posterPath}',
          ),
        )
        .toList();
  }
}
