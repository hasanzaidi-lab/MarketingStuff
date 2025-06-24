
---

# 🏗️ Architecture and Design

### 1. What Do You Do in Code Review?

* Check for code clarity, readability, and maintainability
* Enforce architecture and naming conventions
* Ensure [SOLID](https://github.com/hasanzaidi-lab/MarketingStuff/blob/587152196a3bdd11c9cb07bc93f731464570cf30/Monday_06_23/ArchAndDesignReadme.md#22-solid-principles-with-examples) principles and single-responsibility
* Validate thread safety, memory leaks, and force unwraps
* Suggest better ways to use patterns like MVVM, Combine, etc.

### 2. MVC Architecture

* Model-View-Controller
* **Model**: data & business logic
* **View**: UI
* **Controller**: glue logic
  **✅ Advantages**: Simple, widely used
  **❌ Disadvantages**: Massive View Controller, hard to test

### 3. MVVM Architecture

* Model-View-ViewModel
* ViewModel prepares data for View
* Uses Combine or bindings
  **✅ Advantages**: Testable, separation of concerns
  **❌ Disadvantages**: Learning curve, boilerplate

### 4. VIPER Architecture

* View, Interactor, Presenter, Entity, Router
* Inspired by Clean Architecture
* Highly modular, testable, and scalable
  **✅ Pros**: Clear responsibility, testable
  **❌ Cons**: Verbose, overkill for small projects

### 5. MVP Architecture

* Model-View-Presenter
* Presenter updates View
  **✅ Easier to test than MVC**
  **❌ More boilerplate than MVVM**

### 6. MVC vs MVVM

* MVC: tight coupling, controller bloated
* MVVM: better separation, uses reactive bindings

### 7. MVVM vs MVP

* MVVM: ViewModel has state and bindings
* MVP: Presenter tells View what to display

### 8. What is Clean Architecture?

* Separation into layers: UI, UseCases, Entities, Data
* Dependency flows inward
* Promotes testability and independence from frameworks

### 9. Which Architecture Would You Use for a New Project?

* MVVM with Combine or SwiftUI
* For large teams or banks → MVVM-C or VIPER

### 10. Different Design Patterns Used in iOS

* Singleton
* Delegate
* Observer
* Factory
* Builder
* Strategy
* MVVM

### 11. What is Singleton Pattern?

* Ensures a single shared instance

### 12. Singleton Example and Pros/Cons

```swift
class Logger {
    static let shared = Logger()
    private init() {}
}
```

**✅ Pros**: Global access, memory-safe
**❌ Cons**: Hard to mock/test, hidden dependencies

### 13. Should You Use Many Singletons?

❌ No. Use carefully. Prefer DI where possible

### 14. iOS Framework Singletons

* `UserDefaults.standard`
* `NotificationCenter.default`
* `FileManager.default`
* `URLSession.shared`
* `UIScreen.main`

### 15. Protocol-Delegate Pattern

```swift
protocol MyDelegate: AnyObject {
    func didTap()
}
class VC {
    weak var delegate: MyDelegate?
}
```

Used for communication between classes

### 16. Notification Pattern

```swift
NotificationCenter.default.post(name: .refresh, object: nil)
NotificationCenter.default.addObserver(forName: .refresh, object: nil, queue: .main) { _ in
    print("Refreshed")
}
```

Broadcasts messages across app

### 17. Observer-Subscriber Pattern

Common in Combine/SwiftUI

```swift
class ViewModel: ObservableObject {
    @Published var name = ""
}
```

View binds to `@Published` property and auto-updates

### 18. Factory Design Pattern

Encapsulates object creation

```swift
protocol Vehicle {}
class Car: Vehicle {}
class Bike: Vehicle {}
class VehicleFactory {
    func make(type: String) -> Vehicle {
        switch type {
        case "car": return Car()
        case "bike": return Bike()
        default: fatalError("Unknown")
        }
    }
}
```

### 19. Builder Pattern

Builds complex objects step-by-step

```swift
struct Meal {
    var bread: String?
    var drink: String?
}
class MealBuilder {
    private var meal = Meal()
    func setBread(_ bread: String) -> Self {
        meal.bread = bread
        return self
    }
    func setDrink(_ drink: String) -> Self {
        meal.drink = drink
        return self
    }
    func build() -> Meal {
        return meal
    }
}
```

### 20. Facade Pattern

Simplifies complex subsystems

```swift
class AuthService {
    func checkAuth() { print("Auth Checked") }
}
class TransactionService {
    func execute() { print("Transaction Executed") }
}
class PaymentFacade {
    let authService = AuthService()
    let transactionService = TransactionService()

    func makePayment() {
        authService.checkAuth()
        transactionService.execute()
    }
}
```

### 21. \[Intentionally Left Blank]

### 22. SOLID Principles with Examples

#### S: Single Responsibility

```swift
class Invoice {
    func calculateTotal() {}
}
class InvoicePrinter {
    func print(invoice: Invoice) {}
}
```

Split printing and calculation

#### O: Open/Closed Principle

```swift
protocol Shape {
    func area() -> Double
}
class Circle: Shape {
    var radius: Double
    init(radius: Double) { self.radius = radius }
    func area() -> Double { .pi * radius * radius }
}
class Square: Shape {
    var side: Double
    init(side: Double) { self.side = side }
    func area() -> Double { side * side }
}
```

You can add new shapes without changing existing code

#### L: Liskov Substitution

```swift
class Bird {
    func fly() {}
}
class Eagle: Bird {}
func letItFly(_ bird: Bird) {
    bird.fly()
}
```

Derived types must honor base behavior

#### I: Interface Segregation

```swift
protocol Printer {
    func printDocument()
}
protocol Scanner {
    func scanDocument()
}
```

Don’t force a class to implement unused methods

#### D: Dependency Inversion

```swift
protocol NetworkService {
    func fetchData()
}
class APIClient: NetworkService {
    func fetchData() { print("Fetched") }
}
class ViewModel {
    let service: NetworkService
    init(service: NetworkService) {
        self.service = service
    }
}
```

Depend on abstraction, not concrete

