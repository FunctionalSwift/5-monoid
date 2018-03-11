//: Playground - Monoid

class AddUserUseCase {
    let db = UserDatabase()
    
    func add(name: String, password: String) -> Result<User, UserError> {
        if let failure = validate(name: name) {
            return .failure(failure)
        }
        
        if let failure = validate(password: password) {
            return .failure(failure)
        }
        
        let user = User(name: name, password: password)
        
        return .success(db.create(user))
    }

    internal func validate(name: String) -> UserError? {
        if !name.isEmpty && name.count <= 15 {
            return nil
        }
        
        return .userNameOutOfBounds
    }

    
    internal func validate(password: String) -> UserError? {
        if password.count > 10 {
            return nil
        }
        
        return .passwordTooShort
    }
}

let useCase = AddUserUseCase()

let user = useCase.add(name: "alex", password: "functionalswift")
user.map { print("SUCCESS: User created - \($0)") }


