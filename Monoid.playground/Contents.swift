//: Playground - Monoid

class AddUserUseCase {
    let db = UserDatabase()
    
    func add(name: String, password: String) -> Result<User, UserError> {
        let user = User(name: name, password: password)
        
        let validator = validateName && validatePassword
        
        if let failure = validator(user) {
            return .failure(failure)
        }
        
        return .success(db.create(user))
    }

    internal func validateName(of user: User) -> UserError? {
        if !user.name.isEmpty && user.name.count <= 15 {
            return nil
        }
        
        return .userNameOutOfBounds
    }
    
    internal func validatePassword(of user: User) -> UserError? {
        if user.password.count > 10 {
            return nil
        }
        
        return .passwordTooShort
    }

}

let useCase = AddUserUseCase()

let user = useCase.add(name: "alex", password: "functionalswift")
user.map { print("SUCCESS: User created - \($0)") }


