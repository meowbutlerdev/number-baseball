class HistoryView {
    /// 게임 기록 화면 헤더 출력 함수
    func showHistoryHeader() {
        print(Messages.HistoryView.header)
    }

    func showNoHistoryMessage() {
        print(Messages.HistoryView.noHistory)
    }

    /// 게임 기록 출력 함수
    /// - Parameters:
    ///   - date: 포맷팅된 날짜
    ///   - attempts: 시도 횟수
    func showHistories(date: String, attempts: Int) {
        print(Messages.HistoryView.history(date, attempts))
    }
    
    /// 게임 기록 화면 푸터 출력 함수
    func showHistoryFooter() {
        print(Messages.HistoryView.footer)
    }
}
