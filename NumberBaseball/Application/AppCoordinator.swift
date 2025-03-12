class AppCoordinator {
    func run() {
        showMainView()
    }

    func showMainView() {
        let mainViewController = MainViewController(coordinator: self)
        mainViewController.show()
    }

    func showGameView() {
        let gameViewController = GameViewController(coordinator: self)
        gameViewController.show()
    }

    func showHistoryView() {
        let historyViewController = HistoryViewController(coordinator: self)
        historyViewController.show()
    }
}
