class DependencyContainer {
    let historyRepository: HistoryRepository
    let saveHistoryUseCase: SaveHistoryUseCase
    let fetchHistoryUseCase: FetchHistoryUseCase

    init() {
        historyRepository = DefaultHistoryRepository()
        saveHistoryUseCase = SaveHistoryUseCase(repository: historyRepository)
        fetchHistoryUseCase = FetchHistoryUseCase(repository: historyRepository)
    }
}
