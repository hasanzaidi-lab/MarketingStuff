
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

## 22. SOLID Principles with Examples

The **SOLID principles** are 5 foundational guidelines for designing clean, maintainable, and scalable object-oriented software. Let’s break each one down with **real-life analogies**, **code examples**, and **iOS relevance**.

---

## 🟨 1. **S: Single Responsibility Principle (SRP)**

> A class should have **only one reason to change**.

### 🧠 Meaning:

Each class/module should do **one thing** and do it well. If a class handles more than one responsibility, it becomes harder to maintain, test, or extend.

### 🛠 Code Example:

```swift
class Invoice {
    func calculateTotal() { /* pricing logic */ }
}

class InvoicePrinter {
    func print(invoice: Invoice) { /* print logic */ }
}
```

### 🎯 Real-life Analogy:

Think of a **chef** vs. a **waiter**:

* A chef prepares food (calculation).
* A waiter serves the food (printing).
  They have different jobs, and should be changed for different reasons.

### 🍏 In iOS:

Separate `NetworkManager`, `DataParser`, `ViewModel`, and `ViewController`.
Don't put API, UI logic, and parsing all in a single view controller.

---

## 🟨 2. **O: Open/Closed Principle (OCP)**

> Software entities should be **open for extension but closed for modification**.

### 🧠 Meaning:

You should be able to **add new functionality** without changing existing code.

### 🛠 Code Example:

```swift
protocol Shape {
    func area() -> Double
}

class Circle: Shape {
    var radius: Double
    func area() -> Double { .pi * radius * radius }
}

class Square: Shape {
    var side: Double
    func area() -> Double { side * side }
}
```

### 🎯 Real-life Analogy:

Think of a **power strip**: you can plug in new devices (extensions) without modifying the strip (existing code).

### 🍏 In iOS:

Instead of a giant `switch` on `enum` types in your view controller, use polymorphism or protocol-based views for different UI states (`EmptyStateView`, `ErrorStateView`).

---

## 🟨 3. **L: Liskov Substitution Principle (LSP)**

> Subtypes must be **substitutable for their base types**.

### 🧠 Meaning:

Derived classes should behave in a way that won’t break the expectations from the base class.

### 🛠 Code Example:

```swift
class Bird {
    func fly() {}
}

class Eagle: Bird {}

func letItFly(_ bird: Bird) {
    bird.fly()
}
```

If we add:

```swift
class Penguin: Bird {
    override func fly() {
        fatalError("Penguins can't fly")
    }
}
```

This violates LSP.

### 🎯 Real-life Analogy:

A **car** is a subtype of a **vehicle**, and should drive. If you define `drive()` on `Vehicle`, a `Bicycle` that can't `drive()` in the same way may break logic that expects a car.

### 🍏 In iOS:

If `UIViewController` subclasses override lifecycle methods (`viewDidLoad`, `viewWillAppear`), they must maintain expected behavior or it breaks system logic (like navigation stack or transitions).

---

## 🟨 4. **I: Interface Segregation Principle (ISP)**

> Don't force classes to implement **unnecessary methods**.

### 🧠 Meaning:

Break large interfaces into **smaller, specific ones**, so classes only implement what they need.

### 🛠 Code Example:

```swift
protocol Printer {
    func printDocument()
}

protocol Scanner {
    func scanDocument()
}
```

Now a `SimplePrinter` only conforms to `Printer`, and a `MultiFunctionMachine` can conform to both.

### 🎯 Real-life Analogy:

A **calculator** shouldn't have to support **Bluetooth** just because some devices do. Give it a purpose-specific interface.

### 🍏 In iOS:

Separate protocols for `UITableViewDataSource`, `UITableViewDelegate`, and `UISearchResultsUpdating` lets a class adopt only what it needs.

---

## 🟨 5. **D: Dependency Inversion Principle (DIP)**

> Depend on **abstractions**, not concrete implementations.

### 🧠 Meaning:

High-level modules shouldn't depend on low-level ones. Both should depend on abstractions (e.g. protocols).

### 🛠 Code Example:

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

### 🎯 Real-life Analogy:

You charge your phone using a **USB port**, not a direct wire to a specific power source. The USB standard is an **abstraction**.

### 🍏 In iOS:

Inject `NetworkService` into a view model via protocols so you can **swap real API with a mock** in tests.

---

## ✅ Summary Table

| Principle | Meaning                              | Analogy                      | iOS Example                    |
| --------- | ------------------------------------ | ---------------------------- | ------------------------------ |
| **S**     | One responsibility per class         | Chef vs. Waiter              | ViewModel vs Network vs View   |
| **O**     | Extend, don’t modify                 | Power strip                  | New view types via protocol    |
| **L**     | Subtypes must not break expectations | Penguin vs. Bird             | Safe view controller overrides |
| **I**     | Small interfaces, specific roles     | Calculator with no Bluetooth | Split delegate/data source     |
| **D**     | Depend on abstractions               | USB charging                 | Inject services via protocol   |

---
