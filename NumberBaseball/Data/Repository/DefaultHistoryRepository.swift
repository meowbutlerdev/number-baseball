class DefaultHistoryRepository: HistoryRepository {
    private var histories: [History] = []

    /// 게임 기록 저장 함수
    /// - Parameter history: History Model
    func save(history: History) {
        histories.append(history)
    }
    
    /// 게임 기록 fetch 함수
    /// - Returns: History 배열
    func fetchHistories() -> [History] {
        histories
    }
}
