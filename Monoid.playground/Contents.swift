//: Playground - Monoid

class AddUserUseCase {
    let db = UserDatabase()
    
    func add(name: String, password: String) -> User? {
        if validate(name: name) && validate(password: password) {
            let user = User(name: name, password: password)
            db.create(user)
            
            return user
        }
        
        return nil
    }

    internal func validate(name: String) -> Bool {
        return !name.isEmpty && name.count <= 15
    }

    
    internal func validate(password: String) -> Bool {
        return password.count > 10
    }
}

let useCase = AddUserUseCase()

let user = useCase.add(name: "alex", password: "functionalswift")
user.map { print("SUCCESS: User created - \($0)") }


