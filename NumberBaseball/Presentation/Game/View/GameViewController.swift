class GameViewController {
    private let coordinator: AppCoordinator

    private let gameViewModel: GameViewModel
    private let gameView: GameView

    init(
        coordinator: AppCoordinator,
        gameViewModel: GameViewModel,
        gameView: GameView = GameView()
    ) {
        self.coordinator = coordinator

        self.gameViewModel = gameViewModel
        self.gameView = gameView

        setupBindings()
    }
    
    /// 바인딩 설정 함수
    private func setupBindings() {
        gameViewModel.onInputInvalid = { [weak self] in
            self?.gameView.showInvalidInputMessage()
            self?.requestUserInput()
        }

        gameViewModel.onInputResult = { [weak self] trimmedInput in
            self?.gameView.showCalculateResultMessage(trimmedInput: trimmedInput)
        }

        gameViewModel.onNoMatchHint = { [weak self] in
            self?.gameView.showNothingHintMessage()
            self?.requestUserInput()
        }

        gameViewModel.onStrikeBallHint = { [weak self] result in
            self?.gameView.showStrikeAndBallHintMessage(strike: result.strike, ball: result.ball)
            self?.requestUserInput()
        }

        gameViewModel.onGameOver = { [weak self] attempts in
            self?.gameView.showGameClearMessage(attempts: attempts)
            self?.presentMainScreen()
        }
    }

    func show() {
        gameViewModel.generateAnswer()
        requestUserInput()
    }

    /// 사용자 입력 요청 함수
    private func requestUserInput() {
        let userInput = gameView.userInput()
        gameViewModel.handleUserInput(userInput)
    }

    /// 메인 화면으로 이동하는 함수
    private func presentMainScreen() {
        coordinator.presentMainScreen()
    }
}
