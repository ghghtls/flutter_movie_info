class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final List<String> genres;
  final List<ProductionCompany> productionCompanies;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.genres,
    required this.productionCompanies,
  });
}

class ProductionCompany {
  final String name;
  final String logoPath;

  ProductionCompany({required this.name, required this.logoPath});
}
