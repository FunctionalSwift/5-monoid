public enum Result<T, E> {
    case success(_: T)
    case failure(_: E)
    
    public func map<S>(_ transform: (T) -> S) -> Result<S, E> {
        switch self {
        case let .success(value):
            return .success(transform(value))
        case let .failure(reason):
            return .failure(reason)
        }
    }
}
