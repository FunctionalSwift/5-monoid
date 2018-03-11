import Foundation

public typealias Validator<A, E> = (A) -> Result<A, E>

public func &&<A, E>(
    _ firstValidator: @escaping Validator<A, E>,
    _ secondValidator: @escaping Validator<A, E>) -> Validator<A, E> {
    
    return { a in
        let result = firstValidator(a)
        
        switch result {
        case .failure:
            return result
        case let .success(a1):
            return secondValidator(a1)
        }
    }
}
