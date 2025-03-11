class MainView {
    /// 사용자 입력을 받는 함수
    /// - Returns: 입력 받은 값
    func userInput() -> String? {
        showMenuSelectionMessage()
        return readLine()
    }

    /// 메뉴 출력
    func showMenu() {
        print(Messages.MainView.menu)
    }
    
    /// 메뉴 입력 메시지 출력
    func showMenuSelectionMessage() {
        print(Messages.MainView.menuSelection, terminator: Messages.Common.terminator)
    }
    
    /// 입력 오류 메시지 출력
    func showInvalidInputMessage() {
        print(Messages.Common.invalidInput)
    }
    
    /// 게임 시작 메시지 출력
    func showGameStartMessage() {
        print(Messages.MainView.gameStart)
    }

    func showExitMessage() {
        print(Messages.MainView.exit)
    }
}
