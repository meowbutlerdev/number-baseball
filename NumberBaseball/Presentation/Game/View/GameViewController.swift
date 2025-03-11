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

        gameViewModel.onStrikeAndBallCalculated = { [weak self] numbers in
            self?.gameView.showCalculateResultMessage(numbers: numbers)
        }

        gameViewModel.onNothingHint = { [weak self] in
            self?.gameView.showNothingHintMessage()
            self?.requestUserInput()
        }

        gameViewModel.onStrikeAndBallHint = { [weak self] result in
            self?.gameView.showStrikeAndBallHintMessage(strike: result.strike, ball: result.ball)
            self?.requestUserInput()
        }

        gameViewModel.onGameOver = { [weak self] in
            self?.gameView.showGameClearMessage()
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
