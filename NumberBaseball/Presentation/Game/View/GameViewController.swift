class GameViewController {
    private let gameViewModel: GameViewModel
    private let gameView: GameView

    init(gameViewModel: GameViewModel = GameViewModel(), gameView: GameView = GameView()) {
        self.gameViewModel = gameViewModel
        self.gameView = gameView

        setupBindings()
    }
    
    /// 바인딩 설정 함수
    private func setupBindings() {
        gameViewModel.onInvalidInput = { [weak self] in
            self?.gameView.showInvalidInputMessage()
            self?.requestUserInput()
        }

        gameViewModel.onStrikeAndBallCalculated = { [weak self] trimmed in
            self?.gameView.showCalculateResultMessage(trimmed: trimmed)
        }

        gameViewModel.onNothingHint = { [weak self] in
            self?.gameView.showNothingHintMessage()
            self?.requestUserInput()
        }

        gameViewModel.onStrikeAndBallHint = { [weak self] result in
            self?.gameView.showStrikeAndBallHintMessage(strike: result.strike, ball: result.ball)
            self?.requestUserInput()
        }

        gameViewModel.onGameOver = { [weak self] attemptCount in
            self?.gameView.showGameClearMessage(attemptCount: attemptCount)
            self?.showMainView()
        }
    }

    func startGame() {
        gameViewModel.generateAnswer()
        requestUserInput()
    }

    /// 사용자 입력 요청 함수
    private func requestUserInput() {
        let userInput = gameView.userInput()
        gameViewModel.processUserInput(userInput)
    }

    /// 메인 화면으로 이동하는 함수
    private func showMainView() {
        let mainViewController = MainViewController()
        mainViewController.run()
    }
}
