import 'package:flutter/material.dart';
import 'package:flutter_movie_info/pages/detailpage/detail_page.dart';
import 'package:flutter_movie_info/pages/homepage/widgets/movie_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/movie_providers.dart';
import '../../../domain/entities/movie.dart';
import '../home_page.dart';

class MovieListSection extends ConsumerWidget {
  final String title;
  final bool showRanking;
  final MovieCategory category;

  const MovieListSection({
    super.key,
    required this.title,
    required this.category,
    this.showRanking = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(movieProviderByCategory(category));
    final AsyncValue<List<Movie>> state = ref.watch(provider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: state.when(
            data:
                (movies) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailPage(movie: movie),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Stack(
                          children: [
                            Hero(
                              tag: 'poster-${movie.id}',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  movie.posterUrl,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (showRanking)
                              Positioned(
                                left: 8,
                                bottom: 8,
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.black.withOpacity(
                                    0.6,
                                  ),
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('에러: $e'),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
