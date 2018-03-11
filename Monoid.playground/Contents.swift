//: Playground - Monoid

func validatePassword(of user: User) -> Result<User, UserError> {
    if user.password.count > 10 {
        return .success(user)
    }
    
    return .failure(.passwordTooShort)
}

func validateName(of user: User) -> Result<User, UserError> {
    if !user.name.isEmpty && user.name.count <= 15 {
        return .success(user)
    }
    
    return .failure(.userNameOutOfBounds)
}

func createUser(name: String, password: String) -> Result<User, UserError> {
    let validator = validateName && validatePassword
    
    return validator(User(name: name, password: password))
}

let user = createUser(name: "alex", password: "functionalswift")

user.map { print("SUCCESS: User created - \($0)") }
