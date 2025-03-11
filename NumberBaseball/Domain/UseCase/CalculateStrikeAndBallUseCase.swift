protocol CalculateStrikeAndBallUseCase {
    func result(numbers: [Int], answer: [Int]) -> (strike: Int, ball: Int)
}
