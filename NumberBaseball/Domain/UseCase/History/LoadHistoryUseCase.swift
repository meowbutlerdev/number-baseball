struct LoadHistoryUseCase {
    private let historyRepository: HistoryRepository

    init(historyRepository: HistoryRepository) {
        self.historyRepository = historyRepository
    }

    /// 게임 기록 불러오는 함수
    func loadHistories() -> [History] {
        historyRepository.fetchHistory()
    }
}
