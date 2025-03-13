import Foundation

class HistoryViewModel {
    var onHistoryUpdated: (([(date: String, attempts: Int)]) -> Void)?
    var onNoHistory: (() -> Void)?

    private let fetchHistoryUseCase: FetchHistoryUseCase

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()

    init(fetchHistoryUseCase: FetchHistoryUseCase) {
        self.fetchHistoryUseCase = fetchHistoryUseCase
    }

    /// 게임 기록 불러오는 함수
    func fetchHistories() {
        let histories = fetchHistoryUseCase.fetchHistories()
        if histories.isEmpty {
            onNoHistory?()
        } else {
            let formattedHistories = histories.map { formattedHistory($0) }
            onHistoryUpdated?(formattedHistories)
        }
    }

    /// 게임 기록 포맷 함수
    /// - Parameter history: History
    /// - Returns: 포맷팅된 date, attempts 튜플
    private func formattedHistory(_ history: History) -> (date: String, attempts: Int) {
        (date: formattedDate(history.date), attempts: history.attempts)
    }

    /// 날짜 포맷 함수
    /// - Parameter date: Date
    /// - Returns: 포맷팅된 날짜 문자열
    private func formattedDate(_ date: Date) -> String{
        dateFormatter.string(from: date)
    }
}
