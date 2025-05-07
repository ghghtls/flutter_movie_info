import 'package:flutter/material.dart';
import 'package:flutter_movie_info/pages/homepage/widgets/movie_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/movie_list_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('영화 홈')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // 가장 인기있는 영화 이미지
            SizedBox(
              height: 200,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/your_poster_path.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
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
