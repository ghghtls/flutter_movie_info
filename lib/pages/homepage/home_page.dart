import 'package:flutter/material.dart';
import 'package:flutter_movie_info/pages/detailpage/detail_page.dart';
import 'package:flutter_movie_info/provider/movie_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_info/pages/homepage/widgets/movie_category.dart';
import 'widgets/movie_list_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularState = ref.watch(popularMoviesProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              '가장 인기있는',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // 가장 인기있는 영화 이미지
            popularState.when(
              data: (movies) {
                if (movies.isEmpty) {
                  return const Center(child: Text('데이터 없음'));
                }
                final topMovie = movies.first;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(movie: topMovie),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${topMovie.posterPath}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 500,
                      errorBuilder:
                          (_, __, ___) =>
                              const Center(child: Icon(Icons.broken_image)),
                    ),
                  ),
                );
              },
              loading:
                  () => const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  ),
              error: (e, _) => Center(child: Text('에러: $e')),
            ),

            const SizedBox(height: 20),

            /// 이 아래부터 각각의 상태를 가진 섹션
            MovieListSection(
              title: '현재 상영중',
              category: MovieCategory.nowPlaying,
            ),
            MovieListSection(
              title: '인기순',
              category: MovieCategory.popular,
              showRanking: true,
            ),
            MovieListSection(title: '평점 높은순', category: MovieCategory.topRated),
            MovieListSection(title: '개봉예정', category: MovieCategory.upcoming),
          ],
        ),
      ),
    );
  }
}
