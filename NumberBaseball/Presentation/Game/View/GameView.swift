class GameView {
    /// 사용자 입력을 받는 함수
    /// - Returns: 입력 받은 값
    func userInput() -> String? {
        showInputMessage()
        return readLine()
    }

    /// 사용자 입력 안내 메시지 출력 함수
    func showInputMessage() {
        print("중복되지 않는 세 자리 숫자를 입력하세요. (예: 123):", terminator: " ")
    }
    
    /// 입력 오류 안내 메시지 출력 함수
    func showInvalidInputMessage() {
        print("입력이 잘못되었습니다.")
    }
    
    /// 입력값 안내 메시지 출력 함수
    /// - Parameter numbers: 사용자 입력값
    func showCalculateResultMessage(trimmed: String) {
        print("입력한 숫자 \(trimmed)은(는)", terminator: " ")
    }
    
    /// Strike와 Ball 개수 안내 메시지 출력 함수
    /// - Parameters:
    ///   - strike: Strike 개수
    ///   - ball: Ball 개수
    func showStrikeAndBallHintMessage(strike: Int, ball: Int) {
        print("\(strike) Strike, \(ball) Ball 입니다.")
    }
    
    /// Strike와 Ball이 모두 0개일 때 안내 메시지 출력 함수
    func showNothingHintMessage() {
        print("Nothing 입니다.")
    }
    
    /// 정답 안내 메시지 출력 함수
    func showGameClearMessage() {
        print("정답입니다!")
    }
}

