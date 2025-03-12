protocol HistoryRepository {
    func saveHistory(history: History)
    func fetchHistory() -> [History]
}
