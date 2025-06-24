
---

# 🧵 Multithreading, GCD, OperationQueue, Async/Await

### 1. Different Ways to Do Multithreading in iOS

* Grand Central Dispatch (GCD)
* OperationQueue
* Async/Await
* Combine `.receive(on:)`, `Task {}` in Swift concurrency

### 2. GCD vs OperationQueue

| Feature           | GCD                    | OperationQueue            |
| ----------------- | ---------------------- | ------------------------- |
| API Style         | C-like functions       | OOP (class-based)         |
| Dependencies      | ❌                      | ✅                         |
| Priority/QoS      | ✅                      | ✅                         |
| Cancel operations | ❌                      | ✅                         |
| Best For          | Lightweight async code | Complex task coordination |

### 3. GCD vs Async/Await

* GCD is callback-based; Async/Await is structured concurrency
* Async/Await is easier to read and reason about

### 4. What is Race Condition?

When two threads access the same data and one modifies it concurrently → unexpected results

### 5. How to Solve Race Condition in iOS?

* Use `DispatchQueue.sync` for atomicity
* Use `NSLock`, `DispatchSemaphore`, or `actor` for protection

### 6. What is Deadlock?

* Two tasks wait on each other → nothing progresses
* Common with `DispatchQueue.sync` used on main queue

### 7. UI Code Runs on Which Thread?

* Always the **main thread**

---

## 🔁 GCD (Grand Central Dispatch)

### 8. What is GCD?

A low-level API to manage threads and execute tasks concurrently.

### 9. Default Queues in GCD

```swift
DispatchQueue.main     // UI work
DispatchQueue.global() // Background work
```

### 10. Main Queue vs Global Queue

* `main`: serial, UI updates only
* `global`: concurrent, for background work

### 11. QoS in Global Queue

```swift
DispatchQueue.global(qos: .userInitiated)
```

* .userInteractive: animations
* .userInitiated: quick tasks
* .utility: longer tasks
* .background: least urgent

### 12. Create a Custom Queue

```swift
let customQueue = DispatchQueue(label: "com.myapp.bg", attributes: .concurrent)
```

### 13. Global vs Custom Concurrent Queue

* **Global**: Shared system-wide
* **Custom**: Use for task isolation or to insert barriers

### 14. Dispatch Groups

Coordinate multiple async tasks

```swift
let group = DispatchGroup()
group.enter()
apiCall1 { group.leave() }
group.enter()
apiCall2 { group.leave() }
group.notify(queue: .main) {
  print("All done")
}
```

### 15. Semaphores

Control access to a resource

```swift
let semaphore = DispatchSemaphore(value: 1)
semaphore.wait() // lock
// critical section
semaphore.signal() // unlock
```

### 16. Dispatch Barriers

Used in concurrent queues to block other reads/writes

```swift
queue.async(flags: .barrier) {
  // exclusive write
}
```

### 17. Dispatch Work Item

Re-usable, cancellable task block

```swift
let work = DispatchWorkItem {
  print("Doing work")
}
DispatchQueue.global().async(execute: work)
```

---

## 📦 OperationQueue

### 18. What is OperationQueue?

High-level abstraction over GCD for task management

```swift
let queue = OperationQueue()
queue.addOperation {
  print("Background work")
}
```

### 19. What is BlockOperation?

An operation with multiple execution blocks

```swift
let blockOp = BlockOperation {
  print("Task 1")
}
blockOp.addExecutionBlock {
  print("Task 2")
}
```

---

## 🧪 Async/Await

### 20. What is `async` and How to Use It

```swift
func fetchUser() async -> User {
  // simulate API
}
Task {
  let user = await fetchUser()
}
```

### 21. Advantages of Async/Await

* Readable, avoids callback hell
* Easy to chain async calls in a structured way

### 22. What are Actors?

A reference type that protects its mutable state from concurrent access

```swift
actor Counter {
  var value = 0
  func increment() {
    value += 1
  }
}
```

### 23. What is Main Actor?

Ensures all calls to it run on the main thread

```swift
@MainActor class ViewModel {
  func updateUI() {}
}
```

### 24. Actor vs Class

| Feature                  | Actor           | Class |
| ------------------------ | --------------- | ----- |
| Thread-safe              | ✅               | ❌     |
| Mutable state protection | ✅               | ❌     |
| Performance              | Slightly slower | Fast  |

Let me know if you'd like to add **sample interview questions** or **real-world scenarios** next!



---

# 🧵 Multithreading, GCD, OperationQueue, Async/Await Interview Questions

---

## 🧠 Interview Questions & Real-World Scenarios

### Sample Interview Questions – With Answers

1. **How does GCD differ from OperationQueue, and when would you choose one over the other?**
   GCD is lightweight, function-based, ideal for simple async work. OperationQueue is class-based, supports dependencies, cancellation, and is better for complex workflows.

2. **Explain a scenario where using a Dispatch Group helped coordinate tasks.**
   When loading user profile and settings from separate APIs, I used `DispatchGroup` to wait for both to finish before showing the dashboard.

3. **What is a race condition, and how have you handled it in your code?**
   A race condition happens when multiple threads modify shared state simultaneously. I’ve solved this using `DispatchQueue.sync`, semaphores, or actors to ensure exclusive access.

4. **Can you give an example where a deadlock happened and how you resolved it?**
   Using `DispatchQueue.sync` on the main queue inside a UI block caused a deadlock. I fixed it by removing the sync call or moving it to a background queue.

5. **Why is `@MainActor` important in SwiftUI apps?**
   It ensures that all annotated methods or properties are run on the main thread, keeping UI updates safe and avoiding `DispatchQueue.main.async` clutter.

6. **How do semaphores differ from locks?**
   Semaphores control access to a resource by counting permits. Locks (e.g., `NSLock`) are binary and just block other threads. Semaphores are more flexible.

7. **How does async/await improve over traditional GCD patterns?**
   Async/await avoids callback nesting, offers structured concurrency, better readability, and error propagation.

8. **Can you cancel a DispatchWorkItem? What happens if you try?**
   Yes, using `workItem.cancel()`, but cancellation is cooperative. The block must check `isCancelled` to stop early; otherwise it will still run.

9. **What are the advantages of using Actors over traditional thread-safety techniques?**
   Actors encapsulate state and enforce safe access by design. You don’t need to manage locks or queues manually.

10. **How does QoS affect the performance of a background task?**
    QoS (Quality of Service) sets task priority. `.userInitiated` runs faster than `.background`. It helps the system optimize CPU scheduling for responsiveness or energy saving.

### Real-World Use Cases

* **Dispatch Group**: Wait for multiple APIs (e.g., load profile + settings before showing dashboard)
* **Semaphore**: Limit concurrent access (e.g., only 1 thread can write to file at a time)
* **Dispatch Barrier**: Safely update a shared cache from a concurrent queue
* **Async/Await**: Load user data, then fetch user transactions in a clean sequential flow
* **OperationQueue**: Complex workflows with dependencies (e.g., compress image → upload → notify)
* **Actor**: Manage a shared counter or cache that can be mutated from multiple tasks safely
* **MainActor**: Update UI from any thread without using `DispatchQueue.main.async`

