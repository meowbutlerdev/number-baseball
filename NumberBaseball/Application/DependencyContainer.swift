class DependencyContainer {
    let historyRepository: HistoryRepository
    let saveHistoryUseCase: SaveHistoryUseCase
    let loadHistoryUseCase: LoadHistoryUseCase

    init() {
        historyRepository = DefaultHistoryRepository()
        saveHistoryUseCase = SaveHistoryUseCase(historyRepository: historyRepository)
        loadHistoryUseCase = LoadHistoryUseCase(historyRepository: historyRepository)
    }
}
