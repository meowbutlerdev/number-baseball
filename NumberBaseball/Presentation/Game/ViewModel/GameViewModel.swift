import Foundation

class GameViewModel {
    var onInvalidInput: (() -> Void)?
    var onStrikeAndBallCalculated: ((String) -> Void)?
    var onGameOver: ((Int) -> Void)?
    var onNothingHint: (() -> Void)?
    var onStrikeAndBallHint: (((strike: Int, ball: Int)) -> Void)?

    private let saveHistoryUseCase: SaveHistoryUseCase
    private let generateNumberUseCase: GenerateAnswerUseCase
    private let calculateStrikeAndBallUseCase: CalculateStrikeAndBallUseCase

    private var answer: [Int] = []
    private var attemptCount = 0

    init(
        saveHistoryUseCase: SaveHistoryUseCase,
        generateNumberUseCase: GenerateAnswerUseCase = GenerateAnswerUseCase(),
        calculateStrikeAndBallUseCase: CalculateStrikeAndBallUseCase = CalculateStrikeAndBallUseCase()
    ) {
        self.saveHistoryUseCase = saveHistoryUseCase
        self.generateNumberUseCase = generateNumberUseCase
        self.calculateStrikeAndBallUseCase = calculateStrikeAndBallUseCase
    }
    
    /// 정답 생성 함수
    func generateAnswer() {
        answer = generateNumberUseCase.numbers(
            range: Config.numberRange,
            count: Config.numberCount
        )
    }

    /// 사용자 입력값 처리 함수
    /// - Parameter input: 사용자 입력값
    func processUserInput(_ input: String?) {
        guard let (trimmed, numbers) = parseUserInput(input), isValidUserInput(numbers) else {
            onInvalidInput?()
            return
        }

        increaseAttemptCount()

        let result = calculateStrikeAndball(numbers: numbers, answer: answer)

        onStrikeAndBallCalculated?(trimmed)
        strikeAndBallResult(result: result, attemptCount: attemptCount)
    }

    /// 파싱된 입력값을 검증하는 함수
    /// - Parameter numbers: 파싱된 [Int]
    /// - Returns: 검증 결과
    private func isValidUserInput(_ numbers: [Int]) -> Bool {
        let isUnique = Set(numbers).count == numbers.count
        return numbers.count == Config.numberCount && isUnique
    }

    /// 사용자 입력값을 파싱하는 함수
    /// - Parameter input: 입력값 String
    /// - Returns: (공백제거 문자열, [Int]) 튜플
    private func parseUserInput(_ input: String?) -> (trimmed: String, numbers: [Int])? {
        guard let trimmed = input?.replacingOccurrences(of: " ", with: "") else { return nil }
        let numbers = trimmed.compactMap { $0.wholeNumberValue }
        return (trimmed, numbers)
    }

    /// Strike와 Ball 개수 계산 함수
    /// - Parameters:
    ///   - numbers: 사용자 입력 숫자
    ///   - answer: 정답 숫자
    /// - Returns: Strike와 Ball 개수 튜플
    private func calculateStrikeAndball(numbers: [Int], answer: [Int]) -> (strike: Int, ball: Int) {
        calculateStrikeAndBallUseCase.result(numbers: numbers, answer: answer)
    }
    
    /// 시도 횟수 증가 함수
    private func increaseAttemptCount() {
        attemptCount += 1
    }

    /// 사용자 입력값에 대한 결과 처리 함수
    /// - Parameter result: Strike와 Ball 개수
    private func strikeAndBallResult(result: (strike: Int, ball: Int), attemptCount: Int) {
        if isGameOver(strike: result.strike) {
            saveGameResult(attemptCount)
            onGameOver?(attemptCount)
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
        strike == Config.numberCount
    }
    
    /// 게임 기록 저장 함수
    /// - Parameter attemptCount: 시도 횟수
    private func saveGameResult(_ attemptCount: Int) {
        saveHistoryUseCase.addHistory(attemptCount: attemptCount)
    }
}
