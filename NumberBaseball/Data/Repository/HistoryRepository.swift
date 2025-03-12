class HistoryRepository {
    static let shared = HistoryRepository()

    private var histories: [History] = []

    private init() {}

    /// 게임 기록 저장 함수
    /// - Parameter history: History Model
    func saveHistory(history: History) {
        histories.append(history)
    }
    
    /// 게임 기록 fetch 함수
    /// - Returns: History 배열
    func fetchHistory() -> [History] {
        return histories
    }
}
