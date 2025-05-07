class MovieDetailDto {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final List<Map<String, dynamic>> genres;
  final List<Map<String, dynamic>> productionCompanies;

  MovieDetailDto({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
    required this.productionCompanies,
  });

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) {
    return MovieDetailDto(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'],
      runtime: json['runtime'] ?? 0,
      genres: (json['genres'] as List).cast<Map<String, dynamic>>(),
      productionCompanies:
          (json['production_companies'] as List).cast<Map<String, dynamic>>(),
    );
  }
}
