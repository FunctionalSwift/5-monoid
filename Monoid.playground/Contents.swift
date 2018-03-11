//: Playground - Monoid

class AddUserUseCase {
    let db = UserDatabase()
    
    func add(name: String, password: String) -> Result<User, UserError> {
        let user = User(name: name, password: password)
        
        let validator = validateName && validatePassword
        
        return validator(user).map(db.create)
    }

    internal func validateName(of user: User) -> Result<User, UserError> {
        if !user.name.isEmpty && user.name.count <= 15 {
            return .success(user)
        }
        
        return .failure(.userNameOutOfBounds)
    }
    
    internal func validatePassword(of user: User) -> Result<User, UserError> {
        if user.password.count > 10 {
            return .success(user)
        }
        
        return .failure(.passwordTooShort)
    }
}

let useCase = AddUserUseCase()

let user = useCase.add(name: "alex", password: "functionalswift")
user.map { print("SUCCESS: User created - \($0)") }
