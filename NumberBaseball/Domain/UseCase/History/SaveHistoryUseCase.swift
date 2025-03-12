import Foundation

struct SaveHistoryUseCase {
    private let historyRepository: HistoryRepository

    init(historyRepository: HistoryRepository = DefaultHistoryRepository.shared) {
        self.historyRepository = historyRepository
    }

    /// 게임 기록 저장 함수
    /// - Parameter attemptCount: 시도 횟수
    func addHistory(attemptCount: Int) {
        let history = History(date: Date(), attemptCount: attemptCount)
        historyRepository.saveHistory(history: history)
    }
}
