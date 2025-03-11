class MainView {
    /// 사용자 입력을 받는 함수
    /// - Returns: 입력 받은 값
    func userInput() -> String? {
        showMenuSelectionMessage()
        return readLine()
    }

    /// 메뉴 출력
    func showMenu() {
        print("""
        ***************************************************************
                              ⚾ NUMBER BASEBALL ⚾                  
        ---------------------------------------------------------------
          1️⃣  게임 시작하기
        ***************************************************************
        """)
    }
    
    /// 메뉴 입력 메시지 출력
    func showMenuSelectionMessage() {
        print("메뉴를 입력하세요:", terminator: " ")
    }
    
    /// 입력 오류 메시지 출력
    func showInvalidInputMessage() {
        print("입력이 잘못되었습니다.")
    }
    
    /// 게임 시작 메시지 출력
    func showGameStartMessage() {
        print("게임을 시작합니다.")
    }
}
