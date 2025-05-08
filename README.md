# 🎬 Flutter Movie Info App

Flutter 기반으로 제작된 영화 정보 앱입니다. TMDB(The Movie Database) API를 연동하여 현재 상영 중인 영화, 인기 영화, 평점 높은 영화, 개봉 예정 영화를 실시간으로 불러와 보여줍니다.  
클린 아키텍처(Clean Architecture)와 테스트 코드 기반으로 설계되었으며, 실무에서 사용 가능한 구조와 코드 품질을 갖추는 것을 목표로 개발되었습니다.

---

## 🛠 주요 기술 스택

- **Flutter 3.x**
- **Riverpod**: 상태 관리
- **Clean Architecture**: Domain / Data / Presentation 계층 분리
- **flutter_dotenv**: .env 환경변수 관리
- **http**: REST API 통신
- **Material 3**: 최신 다크 테마 UI
- **mockito + flutter_test**: 단위 테스트 및 ViewModel 테스트
- **Hero 위젯**: 부드러운 이미지 전환 애니메이션

---

## 📱 주요 기능 요약

| 기능 구분 | 설명 |
|-----------|------|
| 홈 화면 | 현재 상영 중, 인기순, 평점 높은순, 개봉 예정 영화 리스트 제공 |
| 영화 상세 페이지 | 포스터, 제목, 개봉일, 장르, 평점, 줄거리, 제작사 로고까지 세부 정보 제공 |
| Hero 애니메이션 | 영화 카드에서 상세 페이지로 부드럽게 전환 |
| API 통신 | TMDB API를 통한 실시간 데이터 수신 |
| 상태 관리 | Riverpod 기반 비동기 상태 처리 |
| 환경변수 관리 | `.env` 파일을 통한 보안 키 분리 |
| 단위 테스트 | 모든 계층(DTO, DataSource, Repository, UseCase, ViewModel)에 테스트 적용 |
| 다크 테마 | 전체 앱 Material3 다크 테마 기본 설정 |

---


## ✅ 실행 방법

```bash
flutter pub get
flutter run
```

---

## 🧪 테스트 실행

```bash
flutter test
```

작성된 테스트 항목:

- MovieDto / MovieDetailDto JSON 파싱 테스트
- MovieApi (MockClient 사용)
- MovieRepositoryImpl
- GetPopularMovies 유스케이스
- HomePageViewModel 상태 처리
- DetailViewModel 상태 처리

---



## 📁 폴더 구조

```
lib/
├── data/             # TMDB API 통신, DTO, Repository 구현
├── domain/           # Entity, Repository Interface, UseCase
├── pages/            # UI 화면 및 ViewModel
├── provider/         # Riverpod Provider 모음
└── main.dart         # 앱 진입점
```

---

