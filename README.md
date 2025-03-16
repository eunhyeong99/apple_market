Apple Market App

소개

Apple Market App은 중고 거래 플랫폼으로, 사용자가 물품을 등록하고 거래할 수 있는 기능을 제공합니다.

주요 기능

사용자 인증: Firebase Authentication을 활용한 로그인 및 회원가입

상품 등록 및 조회: 사용자가 상품을 업로드하고, 목록에서 검색 가능

채팅 기능: 실시간 채팅을 통해 거래 가능

위치 기반 검색: 사용자의 현재 위치를 기반으로 가까운 거래 물품 검색

기술 스택

프레임워크: Flutter

상태 관리: Bloc, Riverpod

데이터베이스: Firebase Firestore

백엔드: Firebase Functions

배포: Android (Google Play Store) 및 iOS (App Store)

프로젝트 구조

apple_market_app/
├── lib/              # Flutter 주요 코드
├── test/             # 테스트 코드
├── android/          # 안드로이드 네이티브 코드
├── ios/              # iOS 네이티브 코드
├── asset/            # 앱에서 사용하는 이미지 및 리소스
├── pubspec.yaml      # 의존성 관리 파일
└── README.md         # 프로젝트 설명

설치 및 실행 방법