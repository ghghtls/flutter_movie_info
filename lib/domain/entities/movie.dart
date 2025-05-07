class Movie {
  final int id;
  final String title;
  final String posterPath;
  final double voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
  });
  String get posterUrl {
    if (posterPath.isEmpty) {
      return 'https://via.placeholder.com/120x180?text=No+Image'; // 기본 이미지
    }
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }
}
