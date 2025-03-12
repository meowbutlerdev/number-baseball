enum MainMenuOption: Int {
    case startGame = 1
    case history
    case exit

    /// 선택된 메뉴 옵션 enum 케이스 반환 함수
    /// - Parameter input: 메뉴 번호
    /// - Returns: enum 케이스
    static func from(_ input: Int) -> MainMenuOption? {
        MainMenuOption(rawValue: input)
    }
}
