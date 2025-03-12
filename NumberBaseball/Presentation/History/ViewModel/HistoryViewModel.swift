import Foundation

class HistoryViewModel {
    var onHistoryUpdated: (([(date: String, attemptCount: Int)]) -> Void)?

    private let loadHistoryUseCase: LoadHistoryUseCase

    init(loadHistoryUseCase: LoadHistoryUseCase) {
        self.loadHistoryUseCase = loadHistoryUseCase
    }

    /// 게임 기록 불러오는 함수
    func loadHistories() {
        let histories = loadHistoryUseCase.loadHistories()
        let formattedHistories = histories.map { formattedHistory($0) }

        onHistoryUpdated?(formattedHistories)
    }

    /// 게임 기록 포맷 함수
    /// - Parameter history: History
    /// - Returns: 포맷팅된 date, attemptCount 튜플
    private func formattedHistory(_ history: History) -> (date: String, attemptCount: Int) {
        return (date: formattedDate(history.date), attemptCount: history.attemptCount)
    }

    /// 날짜 포맷 함수
    /// - Parameter date: Date
    /// - Returns: 포맷팅된 날짜 문자열
    private func formattedDate(_ date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        return dateFormatter.string(from: date)
    }
}
