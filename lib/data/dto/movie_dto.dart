class MovieDto {
  final int id;
  final String title;
  final String posterPath;

  MovieDto({required this.id, required this.title, required this.posterPath});

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '',
    );
  }
}
