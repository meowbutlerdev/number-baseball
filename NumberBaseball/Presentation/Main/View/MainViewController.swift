class MainViewController {
    private let mainViewModel: MainViewModel
    private let mainView: MainView

    init(mainView: MainView = MainView(), mainViewModel: MainViewModel = MainViewModel()) {
        self.mainView = mainView
        self.mainViewModel = mainViewModel

        mainViewModel.onInvalidInput = { [weak self] in
            self?.mainView.showInvalidInputMessage()
            self?.requestUserInput()
        }

        mainViewModel.onMenuSelected = { [weak self] selectedMenu in
            self?.handleMenuSelection(selectedMenu)
        }
    }

    func run() {
        mainView.showMenu()
        requestUserInput()
    }

    /// 사용자 입력 요청 함수
    private func requestUserInput() {
        let userInput = mainView.userInput()
        mainViewModel.processUserInput(userInput)
    }
    
    /// 메뉴 핸들러 함수
    /// - Parameter selectedMenu: 메뉴 enum 케이스
    private func handleMenuSelection(_ selectedMenu: MainMenuOption) {
        switch selectedMenu {
        case .startGame:
            mainView.showGameStartMessage()

            let gameViewController = GameViewController()
            gameViewController.startGame()
        }
    }
}
