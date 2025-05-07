import 'package:flutter/material.dart';
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
            // 영화 섹션들
            const MovieListSection(title: '현재 상영중'),
            const MovieListSection(title: '인기순', showRanking: true),
            const MovieListSection(title: '평점 높은순'),
            const MovieListSection(title: '개봉예정'),
          ],
        ),
      ),
    );
  }
}
