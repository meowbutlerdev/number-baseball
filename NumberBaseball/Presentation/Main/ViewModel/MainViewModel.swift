//import Foundation

class MainViewModel {
    var onInputInvalid: (() -> Void)?
    var onMenuSelected: ((MainMenuOption) -> Void)?
    
    /// 사용자 입력 처리 함수
    /// - Parameter input: 사용자 입력값
    func handleUserInput(_ input: String?) {
        guard let selectedMenu = parseUserInput(input) else {
            onInputInvalid?()
            return
        }

        onMenuSelected?(selectedMenu)
    }
    
    /// 입력값 파싱 함수
    /// - Parameter input: 입력값 String
    /// - Returns: enum 케이스
    private func parseUserInput(_ input: String?) -> MainMenuOption? {
        guard let input =  input?.replacingOccurrences(of: " ", with: ""),
              let inputNumber = Int(input),
              let selectedMenu = MainMenuOption.from(inputNumber) else {
            return nil
        }

        return selectedMenu
    }
}
