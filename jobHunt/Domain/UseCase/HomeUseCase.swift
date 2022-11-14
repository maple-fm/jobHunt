struct HomeUsecase {
    let sessionRepository = SessionRepository()

    func getEvents() -> HomeModel {
        let sessions = sessionRepository.getSessions()
        let es = esRepository.getSessions()
        return sessions + es
    }
}