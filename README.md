# OGADA

패스트 캠퍼스 에서 진행한 첫번째 팀 프로젝트 입니다.

장소 검색을 통해 여행 동선을 계획하고 기록하며 예산을 설정하고 지출을 관리합니다.





## Description

- 개발 기간: 2020.03.09~ 2020.03.13 (5일)
- 참여 인원: iOS 3명
  - [eujin811](https://github.com/eujin811)
  - [wydryd125](https://github.com/wydryd125)
  - [JoongChangYang](https://github.com/JoongChangYang)
- 사용 기술
  - Language: Swift5
  - Framework: UIKit, MapKit
  - Open API
    - Google: GooglePlaces
    - 공공 데이터 포털: 인천공항 출국장 혼잡도 API 
    - Yahoo! Finance: 환율 정보 API



## implementation

- 메인, 보딩패스

  <img src = "https://github.com/JoongChangYang/OGADA_iOS/blob/master/assets/Main%26BordingPass.gif"></img>

  contributor: [wydryd125](https://github.com/wydryd125/OGADA_iOS)

  - 여행 갈 나라, 사용할 화폐, 기간 등을 설정하고 새로운 여행을 생성
  - 인천공항의 출국장 혼잡도 데이터를 받아서 사용자에게 제공
  - 티켓 정보를 입력 받아 보딩패스를 보여줌
    - 공공 데이터 포털에서 제공하는것을 확인 하고 진행 했으나 실제로는 데이터를 주지 않아 구현하지 못함.

- 여행 동선

  <img src = "https://github.com/JoongChangYang/OGADA_iOS/blob/master/assets/movingline.gif"></img>

  contributor: [JoongChangYang](https://github.com/JoongChangYang/OGADA_iOS/tree/doro)

  - 가고싶은 지역을 검색하고 동선에 추가, 저장
  - 동선을 날짜 별로 관리하고 방문한 지역을 표시

- 지출관리

  이미지 첨부 예정

  contributor: [eujin811](https://github.com/eujin811/OGADA_iOS)

  - 실시간 환율을 적용해서 지출 관리

  - 날짜 별로 지출을 관리
  - 지출에 사진과 코멘트를 달아 기록