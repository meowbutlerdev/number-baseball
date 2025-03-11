class GameViewController {
    private let gameViewModel: GameViewModel
    private let gameView: GameView

    init(gameViewModel: GameViewModel = GameViewModel(), gameView: GameView = GameView()) {
        self.gameViewModel = gameViewModel
        self.gameView = gameView

        gameViewModel.onInvalidInput = { [weak self] in
            self?.gameView.showInvalidInputMessage()
            self?.requestUserInput()
        }

        gameViewModel.onValidInput = { [weak self] numbers in
            self?.gameView.showUserInput(numbers)
        }
    }

    func start() {
        gameViewModel.start()
        requestUserInput()
    }

    /// 사용자 입력 요청 함수
    private func requestUserInput() {
        let userInput = gameView.userInput()
        gameViewModel.processUserInput(userInput)
    }
}
