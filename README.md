# 프로젝트 개요
프로젝트명: 콘솔기반 숫자 야구 게임  
개발 기간: 2025.03.10 ~ 2025.03.13  
사용 기술: Swift, Xcode  
학습 목표: Swift, 로직 설계, MVVM, Clean Architecture, Coordinator  

# 게임 방법
1. Xcode에서 실행하여 시작
2. 콘솔에서 숫자를 입력하며 진행

> "숫자 야구 게임은 두 명이 즐길 수 있는 추리 게임으로, 상대방이 설정한 3자리의 숫자를 맞히는 것이 목표입니다. 각 자리의 숫자와 위치가 모두 맞으면 '스트라이크', 숫자만 맞고 위치가 다르면 '볼'로 판정됩니다. 예를 들어, 상대방의 숫자가 123일 때 132를 추리하면 1스트라이크 2볼이 됩니다. 이러한 힌트를 활용하여 상대방의 숫자를 추리해 나가는 게임입니다."

### 게임 진행 방식
1. 랜덤 숫자 생성
2. 사용자 입력 받기
3. 스트라이크/볼 판정
4. 정답 맞힐 때까지 반복
5. 정답을 맞히면 게임 종료

# 프로젝트 구조
```NumberBaseball/
├── Appication/
│   ├── AppCoordinator.swift
│   ├── DependencyContainer.swift
│   └── main.swift
├── Data/
│   ├── Repository/
│   │   └── DefaultHistoryRepository.swift
├── Domain/
│   ├── Model/
│   │   ├── GameConfig.swift
│   │   ├── History.swift
│   │   └── MainMenuOption.swift
│   ├── Repository/
│   │   └── HistoryRepository.swift
│   ├── UseCase/
│   │   ├── Game/
│   │   │   ├── AnswerGenerationUseCase.swift
│   │   │   └── StrikeBallCalculationUseCase.swift
│   │   └── History/
│   │       ├── FetchHistoryUseCase.swift
│   │       └── SaveHistoryUseCase.swift
└── Presentation/
    ├── Game/
    │   ├── View/
    │   │   ├── GameView.swift
    │   │   └── GameViewController.swift
    │   └── ViewModel/
    │       └── GameViewModel.swift
    ├── History/
    │   ├── View/
    │   │   ├── HistoryView.swift
    │   │   └── HistoryViewController.swift
    │   └── ViewModel/
    │       └── HistoryViewModel.swift
    ├── Main/
    │   ├── View/
    │   │   ├── MainView.swift
    │   │   └── MainViewController.swift
    │   └── ViewModel/
    │       └── MainViewModel.swift
    └── Messages.swift
```

---

프로젝트에 대한 더 자세한 내용은 [블로그](https://until.blog/@meowbutlerdev/-ios--%EC%BD%98%EC%86%94%EA%B8%B0%EB%B0%98-%EC%88%AB%EC%9E%90-%EC%95%BC%EA%B5%AC-%EA%B2%8C%EC%9E%84)에서 확인할 수 있습니다!

