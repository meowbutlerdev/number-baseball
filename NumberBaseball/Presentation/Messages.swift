enum Messages {
    enum MainView {
        static let menu = """
            ***************************************************************
                                  ⚾ NUMBER BASEBALL ⚾                  
            ---------------------------------------------------------------
              1️⃣  게임 시작하기
              2️⃣  종료하기
            ***************************************************************
            """
        static let menuSelection = "메뉴를 입력하세요:"
        static let gameStart = "게임을 시작합니다."
        static let exit = "게임을 종료합니다."
    }

    enum GameView {
        static let input = "중복되지 않는 세 자리 숫자를 입력하세요. (예: 123):"
        static let nothingHint = "Nothing 입니다."
        static let gameClear = "정답입니다!"

        static func calculateResult(_ trimmed: String) -> String {
            return "입력한 숫자 \(trimmed)은(는)"
        }

        static func strikeAndBallHint(_ strike: Int, _ ball: Int) -> String {
            return "\(strike) Strike, \(ball) Ball 입니다."
        }
    }

    enum Common {
        static let terminator = " "
        static let invalidInput = "입력이 잘못되었습니다."
    }
}
