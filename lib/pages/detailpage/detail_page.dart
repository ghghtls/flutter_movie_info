import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_info/domain/entities/movie.dart';
import 'package:flutter_movie_info/pages/detailpage/detail_page_view_model.dart';
import 'package:flutter_movie_info/pages/detailpage/widgets/company_logo_item.dart';
import 'package:flutter_movie_info/pages/detailpage/widgets/stat_item.dart';

class DetailPage extends ConsumerWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailViewModelProvider(movie.id));

    return Scaffold(
      appBar: AppBar(),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('에러: $e')),
        data: (movieDetail) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'poster-${movie.id}',
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (_, __, ___) => const SizedBox(
                          height: 500,
                          child: Center(child: Icon(Icons.broken_image)),
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${movieDetail.title} (${movieDetail.releaseDate ?? "개봉일 미정"})',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movieDetail.overview.isNotEmpty
                            ? movieDetail.overview
                            : "줄거리 정보가 없습니다.",
                        style: const TextStyle(height: 1.4),
                      ),
                      const SizedBox(height: 12),
                      Text("러닝타임: ${movieDetail.runtime ?? "?"}분"),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children:
                            movieDetail.genres
                                .map((genre) => Chip(label: Text(genre)))
                                .toList(),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "통계",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      StatItem(
                        title: "평점",
                        value: movieDetail.voteAverage.toString(),
                      ),
                      // TODO: 나중에 투표수, 인기, 예산, 수익 등 추가 가능
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Text(
                    "제작사",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 80,
                  color: Colors.white.withOpacity(0.9),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: movieDetail.productionCompanies.length,
                    itemBuilder: (context, index) {
                      final company = movieDetail.productionCompanies[index];
                      if (company.logoPath == null ||
                          company.logoPath!.isEmpty) {
                        return const SizedBox.shrink(); // 로고 없는 제작사는 스킵
                      }
                      return CompanyLogoItem(
                        logoUrl:
                            'https://image.tmdb.org/t/p/w200${company.logoPath!}',
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
