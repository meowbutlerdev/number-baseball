class DependencyContainer {
    let historyRepository: HistoryRepository
    let saveHistoryUseCase: SaveHistoryUseCase
    let loadHistoryUseCase: LoadHistoryUseCase

    init() {
        self.historyRepository = DefaultHistoryRepository()
        self.saveHistoryUseCase = SaveHistoryUseCase(historyRepository: historyRepository)
        self.loadHistoryUseCase = LoadHistoryUseCase(historyRepository: historyRepository)
    }
}
