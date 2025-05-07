import 'package:flutter_movie_info/data/datasources/movie_data_source.dart';
import 'package:flutter_movie_info/data/dto/movie_response_dto.dart';
import 'package:flutter_movie_info/domain/entities/movie.dart';
import 'package:flutter_movie_info/domain/entities/movie_detail.dart';
import 'package:flutter_movie_info/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying() async {
    final dto = await dataSource.fetchNowPlaying();
    return dto.results
        .map(
          (e) => Movie(
            id: e.id,
            title: e.title,
            posterPath: e.posterPath,
            voteAverage: e.voteAverage,
          ),
        )
        .toList();
  }

  @override
  Future<List<Movie>> getPopular() => _mapToEntity(dataSource.fetchPopular());

  @override
  Future<List<Movie>> getTopRated() => _mapToEntity(dataSource.fetchTopRated());

  @override
  Future<List<Movie>> getUpcoming() => _mapToEntity(dataSource.fetchUpcoming());

  @override
  Future<MovieDetail> getMovieDetail(int id) async {
    final dto = await dataSource.fetchMovieDetail(id);
    return MovieDetail(
      id: dto.id,
      title: dto.title,
      overview: dto.overview,
      posterPath: dto.posterPath,
      releaseDate: dto.releaseDate,
      runtime: dto.runtime,
      voteAverage: dto.voteAverage,
      genres: dto.genres.map((g) => g['name'] as String).toList(),
      productionCompanies:
          (dto.productionCompanies ?? []).map((c) {
            return ProductionCompany(
              name: c['name'] ?? '',
              logoPath:
                  'https://image.tmdb.org/t/p/w500${c['logo_path'] ?? ''}',
            );
          }).toList(),
    );
  }

  Future<List<Movie>> _mapToEntity(Future<MovieResponseDto> dtoFuture) async {
    final dto = await dtoFuture;
    return dto.results
        .map(
          (e) => Movie(
            id: e.id,
            title: e.title,
            posterPath: e.posterPath,
            voteAverage: e.voteAverage,
          ),
        )
        .toList();
  }
}
