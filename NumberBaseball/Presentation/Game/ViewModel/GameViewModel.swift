import Foundation

class GameViewModel {
    var onInvalidInput: (() -> Void)?
    var onValidInput: (([Int]) -> Void)?

    private let state: State
    private let generateNumberUseCase: GenerateNumberUseCase
    private var answer: [Int] = []

    init(state: State = State(), generateNumberUseCase: GenerateNumberUseCase = GenerateNumberUseCase()) {
        self.state = state
        self.generateNumberUseCase = generateNumberUseCase
    }

    func start() {
        answer = generateNumberUseCase.numbers(
            range: state.numberRange,
            count: state.numberCount
        )
    }

    /// 사용자 입력값 처리 함수
    /// - Parameter input: 사용자 입력값
    func processUserInput(_ input: String?) {
        guard let numbers = parseUserInput(input) else {
            onInvalidInput?()
            return
        }

        onValidInput?(numbers)
    }

    /// 사용자 입력값을 검증하고 Int 배열로 변환하는 함수
    /// - Parameter input: 사용자 입력값
    /// - Returns: 변환된 Int 배열
    private func parseUserInput(_ input: String?) -> [Int]? {
        guard let input = input?.trimmingCharacters(in: .whitespacesAndNewlines) else { return nil }

        let numbers = input.compactMap { $0.wholeNumberValue }
        let isUnique = Set(numbers).count == numbers.count
        let isValid = numbers.count == state.numberCount && isUnique

        return isValid ? numbers : nil
    }
}
