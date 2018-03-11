import Foundation

public func &&<A, E>(
    _ firstValidator: @escaping (A) -> E?,
    _ secondValidator: @escaping (A) -> E?) -> (A) -> E? {
    
    return { a in
        if let result = firstValidator(a) {
            return result
        }
        
        if let result = secondValidator(a) {
            return result
        }
        
        return nil
    }
}
