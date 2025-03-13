import Darwin

class MainViewController {
    private let coordinator: AppCoordinator

    private let mainViewModel: MainViewModel
    private let mainView: MainView

    init(
        coordinator: AppCoordinator,
        mainView: MainView = MainView(),
        mainViewModel: MainViewModel = MainViewModel()
    ) {
        self.coordinator = coordinator

        self.mainView = mainView
        self.mainViewModel = mainViewModel

        setupBindings()
    }
    
    /// 바인딩 설정 함수
    private func setupBindings() {
        mainViewModel.onInputInvalid = { [weak self] in
            self?.mainView.showInvalidInputMessage()
            self?.requestUserInput()
        }

        mainViewModel.onMenuSelected = { [weak self] selectedMenu in
            self?.handleMenuSelection(selectedMenu)
        }
    }

    func show() {
        mainView.showMenu()
        requestUserInput()
    }

    /// 사용자 입력 요청 함수
    private func requestUserInput() {
        let userInput = mainView.userInput()
        mainViewModel.handleUserInput(userInput)
    }
    
    /// 메뉴 핸들러 함수
    /// - Parameter selectedMenu: 메뉴 enum 케이스
    private func handleMenuSelection(_ selectedMenu: MainMenuOption) {
        switch selectedMenu {
        case .startGame:
            mainView.showGameStartMessage()
            coordinator.presentGameScreen()
        case .history:
            coordinator.presentHistoryScreen()
        case .exit:
            mainView.showExitMessage()
            exit(0)
        }
    }
}
