struct GenerateAnswerUseCase {
    /// 정답 숫자를 생성하는 함수
    /// - Parameters:
    ///   - range: 사용할 숫자의 범위
    ///   - count: 사용할 숫자의 개수
    /// - Returns: 숫자 배열
    func numbers(range: ClosedRange<Int>, count: Int) -> [Int] {
        let nonZero = range.filter { $0 != 0 }
        guard let first = nonZero.randomElement() else { return [] }
        let rest = range.filter { $0 != first }.shuffled().prefix(count - 1)

        return [first] + rest
    }
}
