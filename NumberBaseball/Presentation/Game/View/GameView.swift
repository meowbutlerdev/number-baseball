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

    func showUserInput(_ numbers: [Int]) {
        print(numbers)
    }
}

