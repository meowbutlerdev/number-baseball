import Foundation

struct SaveHistoryUseCase {
    private let repository: HistoryRepository

    init(repository: HistoryRepository) {
        self.repository = repository
    }

    /// 게임 기록 저장 함수
    /// - Parameter attempts: 시도 횟수
    func save(attempts: Int) {
        let history = History(date: Date(), attempts: attempts)
        repository.save(history: history)
    }
}
