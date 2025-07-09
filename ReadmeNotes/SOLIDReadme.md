
# SOLID Principles with Examples

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
