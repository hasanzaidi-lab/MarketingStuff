
---

# ✅ Test-Driven Development (TDD) and Testing Experience

### 1. What is TDD?

TDD stands for Test-Driven Development. It’s a development approach where you:

* Write a failing test
* Write minimal code to make it pass
* Refactor the code
  Repeat the cycle (Red → Green → Refactor).

### 2. What Is Your Experience With TDD?

I've used TDD in feature development for banking and connected vehicle apps. It helped catch edge cases early, especially in business logic-heavy components like ViewModels and networking layers.

### 3. TDD vs BDD

| Feature | TDD                        | BDD                          |
| ------- | -------------------------- | ---------------------------- |
| Focus   | Implementation correctness | Behavior and user scenarios  |
| Style   | Unit Tests (XCTest)        | Spec-like tests (Given/Then) |
| Tools   | XCTest                     | Quick & Nimble               |

### 4. Frameworks Used for TDD

* XCTest (standard)
* Quick (BDD syntax)
* Nimble (expressive matchers)
* Mocking frameworks like Cuckoo or Mockingbird

### 5. Experience With BDD

Used Quick and Nimble for behavior-driven tests in modular UI and feature components. Useful for clearly expressing intent in collaborative teams.

### 6. Experience Using Quick and Nimble

Quick allows `describe/context/it` syntax. Nimble makes assertions readable:

```swift
describe("LoginViewModel") {
  it("returns error on invalid input") {
    expect(viewModel.login(username: "", password: "pass")).to(equal(.invalidInput))
  }
}
```

### 7. Advantages of TDD

* Better design
* Prevents regressions
* Improves refactor confidence
* Documents expected behavior

### 8. Disadvantages of TDD

* Slower initial development
* Requires experience to write good tests
* Can lead to over-testing if not careful

### 9. XCTest Lifecycle

```swift
setUp()       // runs before each test
tearDown()    // runs after each test
setUpWithError(), tearDownWithError()
```

Tests should be isolated, repeatable, and independent.

### 10. Experience With UITesting

Used `XCUITest` for flows like login, onboarding, transactions. Validated UI accessibility, flow correctness, and navigation.

```swift
let app = XCUIApplication()
app.launch()
app.textFields["Username"].tap()
app.textFields["Username"].typeText("admin")
```

### 11. Experience With Snapshot Testing

Used tools like **iOSSnapshotTestCase** and **SnapshotTesting** by Point-Free.

* Captures reference image of UI
* Fails test if current view differs
  Useful for regression-proofing complex UI layouts.

