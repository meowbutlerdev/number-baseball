class GameViewModel {
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
}
