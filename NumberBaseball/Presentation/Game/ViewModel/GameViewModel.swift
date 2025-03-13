import Foundation

class GameViewModel {
    var onInputInvalid: (() -> Void)?
    var onInputResult: ((String) -> Void)?
    var onGameOver: ((Int) -> Void)?
    var onNoMatchHint: (() -> Void)?
    var onStrikeBallHint: (((strike: Int, ball: Int)) -> Void)?

    private let saveHistoryUseCase: SaveHistoryUseCase
    private let answerGenerationUseCase: AnswerGenerationUseCase
    private let strikeBallCalculationUseCase: StrikeBallCalculationUseCase

    private var answer: [Int] = []
    private var attempts = 0

    init(
        saveHistoryUseCase: SaveHistoryUseCase,
        answerGenerationUseCase: AnswerGenerationUseCase = AnswerGenerationUseCase(),
        strikeBallCalculationUseCase: StrikeBallCalculationUseCase = StrikeBallCalculationUseCase()
    ) {
        self.saveHistoryUseCase = saveHistoryUseCase
        self.answerGenerationUseCase = answerGenerationUseCase
        self.strikeBallCalculationUseCase = strikeBallCalculationUseCase
    }
    
    /// 정답 생성 함수
    func generateAnswer() {
        answer = answerGenerationUseCase.generateAnswer(
            range: GameConfig.numberRange,
            count: GameConfig.numberCount
        )
    }

    /// 사용자 입력값 처리 함수
    /// - Parameter userInput: 사용자 입력값
    func handleUserInput(_ userInput: String?) {
        guard let (trimmedInput, userNumbers) = parseUserInput(userInput), isValidUserInput(userNumbers) else {
            onInputInvalid?()
            return
        }

        increaseAttempts()

        let result = evaluate(userNumbers: userNumbers, answer: answer)

        onInputResult?(trimmedInput)
        handleResult(result: result)
    }

    /// 파싱된 입력값을 검증하는 함수
    /// - Parameter userNumbers: 파싱된 [Int]
    /// - Returns: 검증 결과
    private func isValidUserInput(_ userNumbers: [Int]) -> Bool {
        let isUnique = Set(userNumbers).count == userNumbers.count
        return userNumbers.count == GameConfig.numberCount && isUnique
    }

    /// 사용자 입력값을 파싱하는 함수
    /// - Parameter userInput: 입력값 String
    /// - Returns: (공백제거 문자열, [Int]) 튜플
    private func parseUserInput(_ userInput: String?) -> (trimmedInput: String, userNumbers: [Int])? {
        guard let trimmedInput = userInput?.replacingOccurrences(of: " ", with: "") else { return nil }
        let userNumbers = trimmedInput.compactMap { $0.wholeNumberValue }
        return (trimmedInput, userNumbers)
    }

    /// Strike와 Ball 개수 계산 함수
    /// - Parameters:
    ///   - userNumbers: 사용자 입력 숫자
    ///   - answer: 정답 숫자
    /// - Returns: Strike와 Ball 개수 튜플
    private func evaluate(userNumbers: [Int], answer: [Int]) -> (strike: Int, ball: Int) {
        strikeBallCalculationUseCase.result(userNumbers: userNumbers, answer: answer)
    }
    
    /// 시도 횟수 증가 함수
    private func increaseAttempts() {
        attempts += 1
    }

    /// 사용자 입력값에 대한 결과 처리 함수
    /// - Parameter result: Strike와 Ball 개수
    private func handleResult(result: (strike: Int, ball: Int)) {
        if isGameOver(strike: result.strike) {
            saveGameResult()
            onGameOver?(attempts)
        } else if result == (0, 0) {
            onNoMatchHint?()
        } else {
            onStrikeBallHint?(result)
        }
    }

    /// 게임 종료 여부 확인 함수
    /// - Parameter strike: Strike 개수
    /// - Returns: 게임 종료 여부
    private func isGameOver(strike: Int) -> Bool {
        strike == GameConfig.numberCount
    }
    
    /// 게임 기록 저장 함수
    /// - Parameter attempts: 시도 횟수
    private func saveGameResult() {
        saveHistoryUseCase.save(attempts: attempts)
    }
}
