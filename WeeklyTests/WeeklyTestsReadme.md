

---

# Detailed Notes on iOS Interview Q\&A 

---

## 1. iOS App Lifecycle States

* **States:**

  * **Active:** App is in the foreground and receiving events.
  * **Inactive:** App is in the foreground but not receiving events (e.g., incoming call).
  * **Background:** App is running in the background, executing code or suspended.
  * **Terminated:** App is not running.
* **Note:** "Dead" is *not* an official lifecycle state.
* **Importance:** Understanding lifecycle states helps in managing resources and state restoration.

---

## 2. UIViewController Lifecycle Order

* **Correct order:**

  * `viewDidLoad` — Called once when the view is loaded into memory.
  * `viewWillAppear` — Called every time before the view becomes visible.
  * `viewDidAppear` — Called every time after the view appears on screen.
* **Why important:** Use `viewDidLoad` for initial setup, `viewWillAppear` for updating UI just before showing.

---

## 3. Difference Between `viewDidLoad` and `viewWillAppear`

* `viewDidLoad`:

  * Called **once** after the view controller's view is loaded.
  * Use for initial one-time setup (e.g., data initialization).
* `viewWillAppear`:

  * Called **every time** before the view appears.
  * Use to refresh UI elements that might change between appearances.

---

## 4. Responder Chain in iOS

* **Definition:** A chain of objects (views, view controllers, etc.) that can respond to events like touches, motion, remote control events.
* **Use:** Event handling — if a view doesn't handle an event, it passes it up the chain.
* **Example:** Tap event propagates until handled or discarded.

---

## 5. Parsing JSON in Swift

* **Tools:**

  * `JSONSerialization` — Manual, less type-safe parsing into dictionaries/arrays.
  * `Codable` — Swift protocol that makes encoding/decoding JSON straightforward with structs/classes.
* **Recommendation:** Use `Codable` for safer, cleaner, and more maintainable parsing.

---

## 6. Purpose of `Codable` Protocol

* Combines `Encodable` and `Decodable`.
* Enables easy conversion between Swift types and JSON or other data formats.
* Simplifies networking, storage, and data interchange tasks.

---

## 7. Valid AppDelegate Lifecycle Methods

* Common methods you implement to respond to app state changes:

  * `application(_:didFinishLaunchingWithOptions:)`
  * `applicationWillEnterForeground(_:)`
  * `applicationDidEnterBackground(_:)`
  * `applicationWillTerminate(_:)`
* These methods help manage initialization, backgrounding, and termination tasks.

---

## 8. Fastlane Use in iOS Development

* **Purpose:** Automates tedious parts of app deployment.
* **Functions:**

  * Build automation
  * Running tests
  * Managing provisioning profiles & certificates
  * Uploading to TestFlight and App Store
  * Generating screenshots
* Saves time and reduces errors in deployment pipeline.

---

## 9. Integrating Third-Party Libraries

* **Popular tools:**

  * **CocoaPods:** Dependency manager using `.podspec` files.
  * **Carthage:** Decentralized, builds frameworks for integration.
  * **Swift Package Manager (SPM):** Official Swift tool integrated into Xcode.
* **Not used:** Xcode CLI Tool — not designed for dependency management.

---

## 10. Dependency Injection (DI)

* **Concept:** Passing required dependencies (objects/services) into a class from outside instead of creating inside.
* **Benefits:**

  * Looser coupling between components.
  * Easier to test (mock dependencies).
  * More flexible and maintainable code.
* **Common approaches:** Initializer injection, property injection.

---

## 11. Deep Linking

* **Definition:** Linking to a specific screen or content inside your app using a custom URL scheme.
* **Example:** `myapp://profile/123` opens the profile screen with user ID 123.
* Useful for marketing, notifications, and cross-app navigation.

---

## 12. Universal Linking

* **Improved deep linking using HTTP/HTTPS URLs.**
* **Benefits:**

  * Works even if the app is not installed (opens website fallback).
  * More secure and reliable.
* **Mechanism:** Uses `apple-app-site-association` JSON file on your website.
* **Example:** `https://example.com/profile/123` opens app if installed.

---

## 13. Accessibility in iOS

* Support for users with disabilities.
* Features include:

  * VoiceOver (screen reader)
  * Larger fonts
  * Dynamic type
  * Switch control
  * Color contrast adjustments
* Using accessibility APIs ensures inclusivity and broader reach.

---

## 14. Content Hugging vs Compression Resistance Priority

* **Content Hugging Priority:**

  * How much a view resists growing larger than its intrinsic content size.
  * Higher priority means "hug" tightly to content.
* **Compression Resistance Priority:**

  * How much a view resists shrinking smaller than its intrinsic content size.
  * Higher priority means less likely to be compressed.
* Both priorities are used in Auto Layout to resolve size conflicts.

---

## 15. Protocol-Oriented Programming (POP) in Swift

* **Paradigm where protocols are the main building blocks** instead of inheritance.
* Promotes:

  * Composition over inheritance.
  * Code reuse via protocol extensions.
  * More flexible, testable designs.
* Swift’s strength: protocols with default implementations.

---

## 16. SwiftUI Property Wrappers for State and Data Binding

* **@State:** Local, mutable state owned by a view.
* **@Binding:** Reference to state owned elsewhere; used for two-way bindings.
* **@ObservedObject:** Observes an external ObservableObject; updates view on change.
* **@EnvironmentObject:** Injects shared ObservableObject from environment.
* **Note:** `@Published` is used inside ObservableObjects, not directly in views.

---

## 17. GeometryReader in SwiftUI

* A container view that reads size and position information of its child views.
* Enables adaptive layouts based on available space.
* Used when you need to make layout decisions dynamically.

---

## 18. View Modifiers in SwiftUI

* Methods that return a modified version of a view without changing the original.
* Examples: `.padding()`, `.background()`, `.cornerRadius()`.
* They are chainable and declarative ways to customize views.

---

## 19. Purpose of @ViewBuilder in SwiftUI

* A result builder that allows you to return multiple views from a closure.
* Removes need for explicit grouping in stacks.
* Used in SwiftUI view initializers and custom view components.

---

## 20. Using SwiftUI Inside UIKit

* Use `UIHostingController(rootView:)` to embed SwiftUI views in UIKit.
* Cannot directly place SwiftUI views in storyboards.
* Useful for gradual migration or combining UI frameworks.

---

## 21. Using UIKit Views in SwiftUI

* Use `UIViewControllerRepresentable` or `UIViewRepresentable` protocols.
* Wrap UIKit components for integration inside SwiftUI.
* Enables reuse of legacy or complex UIKit components.

---

## 22. SwiftUI Animation Modifier

* `.animation()` modifier applies implicit animations to changes in view state.
* Controls timing, easing, and repeat behavior.
* Works with any animatable property.

---

## 23. @Environment(.managedObjectContext) in SwiftUI

* Accesses Core Data's `NSManagedObjectContext` from SwiftUI’s environment.
* Allows fetching, inserting, and saving Core Data entities inside SwiftUI views.

---

## 24. Ways to Perform Multithreading in iOS

* **GCD (Grand Central Dispatch):** Low-level C API for queues.
* **OperationQueue:** Higher-level API supporting dependencies and cancellation.
* **NSThread:** Legacy thread management.
* **async/await:** New Swift concurrency syntax for asynchronous code.
* **performSelectorInBackground:** Objective-C method to run selector on background thread.
* All are valid but some (NSThread, performSelector) are less commonly used today.

---

## 25. Difference Between GCD and OperationQueue

* OperationQueue is built on top of GCD.
* OperationQueue supports:

  * Task dependencies.
  * Cancellation.
  * Priorities.
* GCD is lower-level, more lightweight but less feature-rich.

---

## 26. Async/Await vs GCD

* Async/await provides **structured concurrency**.
* It improves:

  * Code readability.
  * Error handling.
  * Writing asynchronous code that looks synchronous.
* GCD is lower-level and uses callbacks/closures.

---

## 27. Race Condition

* Occurs when multiple threads access shared data concurrently without proper synchronization.
* Leads to unpredictable behavior or corrupted state.
* Common concurrency bug.

---

## 28. Preventing Race Conditions

* Use synchronization mechanisms:

  * Serial queues with `DispatchQueue.sync`.
  * `NSLock`.
  * Barriers in concurrent queues (`dispatch_barrier_async`).
  * `DispatchSemaphore` to limit access.
* Avoiding background threads altogether is impractical.

---

## 29. Deadlock in Multithreading

* Situation where two or more threads wait indefinitely for each other to release resources.
* Causes app freeze or unresponsiveness.
* Avoid by careful locking order and avoiding circular waits.

---

## 30. Thread for UI Updates in iOS

* **Main thread** (aka UI thread) must be used for all UI updates.
* Background threads are for processing, network calls, or heavy tasks.

---

## 31. What is GCD?

* Grand Central Dispatch — API for managing concurrency.
* Provides queues (serial, concurrent) for executing tasks asynchronously or synchronously.
* Simplifies multithreading in iOS and macOS.

---

## 32. Default GCD Queues

* `DispatchQueue.main` — main thread queue, serial.
* `DispatchQueue.global()` — concurrent global queues at different QoS levels.
* No `DispatchQueue.custom()` or `.concurrent()` by default; custom queues must be created.

---

## 33. Main Queue vs Global Queue

* Main queue runs tasks on **main thread** — UI-related work.
* Global queues run tasks concurrently on background threads.
* Use global queues for background work.

---

## 34. QoS in GCD

* Quality of Service specifies priority and resources allocated to a queue/task.
* Levels include:

  * user-interactive (highest)
  * user-initiated
  * utility
  * background (lowest)
* Helps system optimize scheduling.

---

## 35. Creating Custom Concurrent Queue

* Use:

  ```swift
  DispatchQueue(label: "com.custom", attributes: .concurrent)
  ```
* Allows concurrency with control over task execution.

---

## 36. Global Queue vs Custom Concurrent Queue

* Global queue is shared by system, less control.
* Use custom concurrent queue for:

  * Controlling concurrency level.
  * Using barriers.
  * Better task isolation.
* Prefer custom queues when you need precise behavior.

---

## 37. Dispatch Group

* Allows grouping multiple asynchronous tasks.
* Can notify when **all** tasks are completed.
* Useful for coordinating multiple background operations.

---

## 38. Dispatch Semaphore

* Synchronization tool.
* Controls number of threads accessing a resource.
* Can block threads until a resource is available.

---

## 39. Dispatch Barrier

* Used with concurrent queues.
* Allows one task exclusive access, blocking others temporarily.
* Useful for safe writes while reads can happen concurrently.

---

## 40. Dispatch Work Item

* Wraps a block of code.
* Can be submitted to queues.
* Supports cancellation and notification handlers.

---

## 41. OperationQueue

* High-level abstraction over GCD.
* Supports dependencies, priorities, cancellation.
* Makes complex task management easier.

---

## 42. BlockOperation

* Subclass of Operation.
* Allows executing multiple blocks concurrently.
* Useful for grouping related tasks.

---

## 43. Async in Swift

* Keyword marking functions that can suspend execution.
* Used with `await` to call asynchronous code sequentially.
* Improves async code clarity.

---

## 44. Advantages of Async/Await

* Cleaner, easier to read asynchronous code.
* Error handling via `try`/`catch`.
* Makes async code look synchronous, reducing callback nesting.

---

## 45. Actor in Swift Concurrency

* Reference type that protects its internal state from data races.
* Ensures serialized access to its properties and methods.
* Great for managing shared mutable state safely.

---

## 46. @MainActor

* Attribute to mark code that must run on the main thread.
* Ensures UI-related code executes on main thread automatically.

---

## 47. Actor vs Class

* Actors guarantee thread-safe access to mutable state.
* Classes do **not** provide built-in concurrency safety.
* Actors have isolation enforced by compiler/runtime.

---

# Summary

This detailed guide covers core iOS and Swift topics including app lifecycle, UIKit and SwiftUI lifecycles, concurrency models, data parsing, dependency injection, linking, accessibility, and state management. Use this to prepare for interviews or reinforce your knowledge base.

If you want, I can also provide sample code snippets or explanations for any specific topic here.

---

Would you like me to generate flashcards, example code, or interview tips based on these?
