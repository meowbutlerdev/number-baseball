protocol HistoryRepository {
    func save(history: History)
    func fetchHistories() -> [History]
}
