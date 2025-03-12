struct CalculateStrikeAndBallUseCase {
    /// 사용자 입력값과 정답 비교 함수
    /// - Parameters:
    ///   - numbers: 사용자 입력값
    ///   - answer: 정답
    /// - Returns: strike와 ball 개수 튜플
    func result(numbers: [Int], answer: [Int]) -> (strike: Int, ball: Int) {
        var strike = 0, ball = 0
        for (idx, num) in numbers.enumerated() {
            if num == answer[idx] {
                strike += 1
            } else if answer.contains(num) {
                ball += 1
            }
        }

        return (strike, ball)
    }
}
