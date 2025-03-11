import Foundation

class GameViewModel {
    var onInvalidInput: (() -> Void)?
    var onStrikeAndBallCalculated: (([Int]) -> Void)?
    var onGameOver: (() -> Void)?
    var onNothingHint: (() -> Void)?
    var onStrikeAndBallHint: (((strike: Int, ball: Int)) -> Void)?

    private let state: State
    private let generateNumberUseCase: GenerateNumberUseCase
    private let calculateStrikeAndBall: CalculateStrikeAndBall
    private var answer: [Int] = []

    init(
        state: State = State(),
        generateNumberUseCase: GenerateNumberUseCase = GenerateNumberUseCase(),
        calculateStrikeAndBall: CalculateStrikeAndBall = CalculateStrikeAndBall()
    ) {
        self.state = state
        self.generateNumberUseCase = generateNumberUseCase
        self.calculateStrikeAndBall = calculateStrikeAndBall
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

        let result = calculateStrikeAndBall.result(numbers: numbers, answer: answer)

        onStrikeAndBallCalculated?(numbers)
        strikeAndBallResult(result: result)

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

    /// 사용자 입력값에 대한 결과 처리 함수
    /// - Parameter result: Strike와 Ball 개수
    private func strikeAndBallResult(result: (strike: Int, ball: Int)) {
        if isGameOver(strike: result.strike) {
            onGameOver?()
        } else if result == (0, 0) {
            onNothingHint?()
        } else {
            onStrikeAndBallHint?(result)
        }
    }

    /// 게임 종료 여부 확인 함수
    /// - Parameter strike: Strike 개수
    /// - Returns: 게임 종료 여부
    private func isGameOver(strike: Int) -> Bool {
        return strike == state.numberCount
    }
}
