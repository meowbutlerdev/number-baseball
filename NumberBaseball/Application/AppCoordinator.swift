class AppCoordinator {
    private let container: DependencyContainer

    init(container: DependencyContainer = DependencyContainer()) {
        self.container = container

        presentMainScreen()
    }

    func presentMainScreen() {
        let mainViewController = MainViewController(coordinator: self)
        mainViewController.show()
    }

    func presentGameScreen() {
        let gameViewModel = GameViewModel(saveHistoryUseCase: container.saveHistoryUseCase)
        let gameViewController = GameViewController(coordinator: self, gameViewModel: gameViewModel)
        gameViewController.show()
    }

    func presentHistoryScreen() {
        let historyViewModel = HistoryViewModel(fetchHistoryUseCase: container.fetchHistoryUseCase)
        let historyViewController = HistoryViewController(
            coordinator: self,
            historyViewModel: historyViewModel
        )
        historyViewController.show()
    }
}
