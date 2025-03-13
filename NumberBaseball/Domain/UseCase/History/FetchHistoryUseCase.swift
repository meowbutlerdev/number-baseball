struct FetchHistoryUseCase {
    private let repository: HistoryRepository

    init(repository: HistoryRepository) {
        self.repository = repository
    }

    /// 게임 기록 불러오는 함수
    func fetchHistories() -> [History] {
        repository.fetchHistories()
    }
}
