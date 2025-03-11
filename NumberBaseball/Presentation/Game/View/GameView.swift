class GameView {
    /// 사용자 입력을 받는 함수
    /// - Returns: 입력 받은 값
    func userInput() -> String? {
        showInputMessage()
        return readLine()
    }

    /// 사용자 입력 안내 메시지 출력 함수
    func showInputMessage() {
        print(Messages.GameView.input, terminator: Messages.Common.terminator)
    }
    
    /// 입력 오류 안내 메시지 출력 함수
    func showInvalidInputMessage() {
        print(Messages.Common.invalidInput)
    }
    
    /// 입력값 안내 메시지 출력 함수
    /// - Parameter numbers: 사용자 입력값
    func showCalculateResultMessage(trimmed: String) {
        print(Messages.GameView.calculateResult(trimmed), terminator: Messages.Common.terminator)
    }
    
    /// Strike와 Ball 개수 안내 메시지 출력 함수
    /// - Parameters:
    ///   - strike: Strike 개수
    ///   - ball: Ball 개수
    func showStrikeAndBallHintMessage(strike: Int, ball: Int) {
        print(Messages.GameView.strikeAndBallHint(strike, ball))
    }
    
    /// Strike와 Ball이 모두 0개일 때 안내 메시지 출력 함수
    func showNothingHintMessage() {
        print(Messages.GameView.nothingHint)
    }
    
    /// 정답 안내 메시지 출력 함수
    func showGameClearMessage(attemptCount: Int) {
        print(Messages.GameView.gameClear(attemptCount))
    }
}

