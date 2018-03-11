//: Playground - Monoid

class AddUserUseCase {
    let db = UserDatabase()
    
    func add(name: String, password: String) throws -> User {
        try validate(name: name)
        try validate(password: password)
        
        let user = User(name: name, password: password)
        
        return try db.create(user)
    }
    
    internal func validate(name: String) throws {
        if name.isEmpty || name.count > 15 {
            throw UserError.userNameOutOfBounds
        }
    }
    
    internal func validate(password: String) throws {
        if password.count < 10 {
            throw UserError.passwordTooShort
        }
    }
}

let useCase = AddUserUseCase()

do {
    try useCase.add(name: "alex", password: "functionalswift")
} catch UserError.userNameOutOfBounds {
    print("ERROR: User name out of bounds")
} catch UserError.passwordTooShort {
    print("ERROR: Password too short")
}
