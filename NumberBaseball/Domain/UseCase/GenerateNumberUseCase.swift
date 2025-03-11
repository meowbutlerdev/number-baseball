protocol GenerateNumberUseCase {
    func numbers(range: ClosedRange<Int>, count: Int) -> [Int]
}
