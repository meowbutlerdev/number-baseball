import Foundation

class HistoryViewController {
    private let historyViewModel: HistoryViewModel
    private let historyView: HistoryView

    init(
        historyViewModel: HistoryViewModel = HistoryViewModel(),
        historyView: HistoryView = HistoryView()
    ) {
        self.historyViewModel = historyViewModel
        self.historyView = historyView

        setupBindings()
    }

    /// 바인딩 설정 함수
    private func setupBindings() {
        historyViewModel.onHistoryUpdated = { [weak self] formattedHistories in
            self?.showHistories(formattedHistories)
        }
    }
    
    /// 게임 기록 불러오는 함수
    func loadHistories() {
        historyViewModel.loadHistories()
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
        let mainViewController = MainViewController()
        mainViewController.run()
    }
}
