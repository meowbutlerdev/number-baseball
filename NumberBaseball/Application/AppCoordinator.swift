class AppCoordinator {
    private let container: DependencyContainer

    init(container: DependencyContainer = DependencyContainer()) {
        self.container = container

        showMainView()
    }

    func showMainView() {
        let mainViewController = MainViewController(coordinator: self)
        mainViewController.show()
    }

    func showGameView() {
        let gameViewModel = GameViewModel(saveHistoryUseCase: container.saveHistoryUseCase)
        let gameViewController = GameViewController(coordinator: self, gameViewModel: gameViewModel)
        gameViewController.show()
    }

    func showHistoryView() {
        let historyViewModel = HistoryViewModel(loadHistoryUseCase: container.loadHistoryUseCase)
        let historyViewController = HistoryViewController(
            coordinator: self,
            historyViewModel: historyViewModel
        )
        historyViewController.show()
    }
}
