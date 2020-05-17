# OGADA

패스트 캠퍼스에서 진행한 팀 프로젝트 입니다.

장소 검색을 통해 여행 동선을 계획하고 기록하며 예산을 설정하고 지출을 관리합니다.



## Description

- 개발 기간: 2020.03.09~ 2020.03.13 (5일)
- 참여 인원: iOS 3명 [Team repository ⬅️(Detail)](https://github.com/wydryd125/OGADA_iOS/tree/develop)
- 사용 기술
  - Language: Swift5
  - Framework: UIKit, MapKit
  - Open API: 공공 데이터 포털: 인천공항 출국장 혼잡도 API 

- 담당 구현 파트
	- 메인
	- 보딩패스



## implementation

- 메인

  <img src = "https://github.com/JoongChangYang/OGADA_iOS/blob/master/assets/Main%26BordingPass.gif"></img>

  


  - 여행 갈 나라, 사용할 화폐, 기간 등을 설정하여 UserDefaults에 저장

  - UserDefaults에 저장된 여행 정보를 통해 메인 화면의 셀을 구성 (여행지의 사진, title, subtitle, 여행 일정)

    *추후 core data를 이용하여 수정할 계획*

  - 공공 데이터 포털에서 제공하는 인천공항의 출국장 혼잡도 데이터를 XML pacing하여 사용자에게 제공

  - 티켓 정보를 입력 받아 보딩패스를 보여줌

  
