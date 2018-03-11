//: Playground - Monoid

class AddUserUseCase {
    let db = UserDatabase()
    
    func add(name: String, password: String) -> Bool {
        if validate(name: name) && validate(password: password) {
            db.create(User(name: name, password: password))
            return true
        }
        
        return false
    }
    
    internal func validate(name: String) -> Bool {
        return !name.isEmpty && name.count <= 15
    }

    
    internal func validate(password: String) -> Bool {
        return password.count > 10
    }
}

let useCase = AddUserUseCase()

if useCase.add(name: "alex", password: "functionalswift") {
    print("SUCCESS: User created")
} else {
    print("ERROR: Something is wrong")
}

