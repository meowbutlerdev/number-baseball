import Foundation

class HistoryViewController {
    private let coordinator: AppCoordinator

    private let historyViewModel: HistoryViewModel
    private let historyView: HistoryView

    init(
        coordinator: AppCoordinator,
        historyViewModel: HistoryViewModel,
        historyView: HistoryView = HistoryView()
    ) {
        self.coordinator = coordinator

        self.historyViewModel = historyViewModel
        self.historyView = historyView

        setupBindings()
    }

    /// 바인딩 설정 함수
    private func setupBindings() {
        historyViewModel.onNoHistory = { [weak self] in
            self?.showNoHistory()
        }

        historyViewModel.onHistoryUpdated = { [weak self] formattedHistories in
            self?.showHistories(formattedHistories)
        }
    }

    func show() {
        loadHistories()
    }

    /// 게임 기록 불러오는 함수
    private func loadHistories() {
        historyViewModel.loadHistories()
    }
    
    /// 게임 기록 없을 때 출력 함수
    private func showNoHistory() {
        historyView.showHistoryHeader()
        historyView.showNoHistoryMessage()
        historyView.showHistoryFooter()

        showMainView()
    }

    /// 게임 기록 출력 함수
    /// - Parameter formattedHistories: 날짜 포맷 적용된 게임 기록들
    private func showHistories(_ formattedHistories: [(date: String, attemptCount: Int)]) {
        historyView.showHistoryHeader()

        formattedHistories.forEach { formattedHistory in
            historyView.showHistories(date: formattedHistory.date, attemptCount: formattedHistory.attemptCount)
        }

        historyView.showHistoryFooter()

        showMainView()
    }

    /// 메인 화면으로 이동하는 함수
    private func showMainView() {
        coordinator.showMainView()
    }
}
