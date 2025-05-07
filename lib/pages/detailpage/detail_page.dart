import 'package:flutter/material.dart';
import 'widgets/stat_item.dart';
import 'widgets/company_logo_item.dart';
import '../../../domain/entities/movie.dart';

class DetailPage extends StatelessWidget {
  final Movie movie; //  movie 전달받기

  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Hero 애니메이션 이미지
            Hero(
              tag: 'poster-${movie.id}',
              child: Image.network(
                movie.posterUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 제목 + 개봉일
                  Text(
                    '${movie.title} (2024-12-24)', // TODO: 실제 날짜 필드 적용 시 수정
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 태그라인
                  const Text(
                    "태그라인 문구",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),

                  const SizedBox(height: 8),
                  const Text("러닝타임: 132분"),

                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: const [
                      Chip(label: Text("액션")),
                      Chip(label: Text("스릴러")),
                      Chip(label: Text("SF")),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Text("이 영화는 ...", style: TextStyle(height: 1.4)),

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
                children: const [
                  StatItem(title: "평점", value: "8.5"),
                  StatItem(title: "투표수", value: "12,345"),
                  StatItem(title: "인기도", value: "98.2"),
                  StatItem(title: "예산", value: "\$50M"),
                  StatItem(title: "수익", value: "\$210M"),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Text("제작사", style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            Container(
              height: 80,
              color: Colors.white.withOpacity(0.9),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CompanyLogoItem(
                    logoUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/7/7e/Paramount_Pictures_logo.svg',
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
