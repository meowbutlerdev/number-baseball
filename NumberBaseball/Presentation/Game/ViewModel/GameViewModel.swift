import Foundation

class GameViewModel {
    var onInvalidInput: (() -> Void)?
    var onStrikeAndBallCalculated: ((String) -> Void)?
    var onGameOver: (() -> Void)?
    var onNothingHint: (() -> Void)?
    var onStrikeAndBallHint: (((strike: Int, ball: Int)) -> Void)?

    private let state: State
    private let generateNumberUseCase: GenerateNumberUseCase
    private let calculateStrikeAndBall: CalculateStrikeAndBallUseCase
    private var answer: [Int] = []

    init(
        state: State = State(),
        generateNumberUseCase: GenerateNumberUseCase = DefaultGenerateNumberUseCase(),
        calculateStrikeAndBall: CalculateStrikeAndBallUseCase = DefaultCalculateStrikeAndBallUseCase()
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
        guard let (trimmed, numbers) = parseUserInput(input), isValidUserInput(numbers) else {
            onInvalidInput?()
            return
        }

        let result = calculateStrikeAndBall.result(numbers: numbers, answer: answer)

        onStrikeAndBallCalculated?(trimmed)
        strikeAndBallResult(result: result)
    }


    /// 파싱된 입력값을 검증하는 함수
    /// - Parameter numbers: 파싱된 [Int]
    /// - Returns: 검증 결과
    private func isValidUserInput(_ numbers: [Int]) -> Bool {
        let isUnique = Set(numbers).count == numbers.count
        return numbers.count == state.numberCount && isUnique
    }

    /// 사용자 입력값을 파싱하는 함수
    /// - Parameter input: 입력값 String
    /// - Returns: (공백제거 문자열, [Int]) 튜플
    private func parseUserInput(_ input: String?) -> (trimmed: String, numbers: [Int])? {
        guard let trimmed = input?.trimmingCharacters(in: .whitespacesAndNewlines) else { return nil }
        let numbers = trimmed.compactMap { $0.wholeNumberValue }
        return (trimmed, numbers)
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
