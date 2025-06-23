
---

# 🚀 iOS System Design, Lifecycle, Tools & Integration

### 1. What Is App Lifecycle?

Describes the states an iOS app transitions through: Not Running → Inactive → Active → Background → Suspended

### 2. App States

* **Not running**: App is not launched
* **Inactive**: App is in foreground but not receiving events
* **Active**: App is running in foreground and receiving events
* **Background**: App is running but not visible
* **Suspended**: App is in memory but not executing code

### 3. WillFinish vs DidFinish

* `application(_:willFinishLaunchingWithOptions:)`: called before app is fully launched (useful for setting defaults)
* `application(_:didFinishLaunchingWithOptions:)`: called after app has launched (used for setup like analytics, DI, UI setup)

### 4. What Is SceneDelegate?

Introduced in iOS 13 for multi-window support. Manages a single window instance (e.g., window lifecycle, deep links).

### 5. UIViewController Lifecycle

`loadView` → `viewDidLoad` → `viewWillAppear` → `viewDidAppear` → `viewWillDisappear` → `viewDidDisappear`

### 6. UIView Lifecycle

`init` → `awakeFromNib` → `layoutSubviews` → `draw(_:)`

### 7. What Is Responder Chain?

A hierarchy of objects (UIResponder subclasses) that receive and respond to events like touches, gestures, key input.

### 8. How To Parse JSON?

Using `Codable`:

```swift
struct User: Codable { let name: String }
let user = try JSONDecoder().decode(User.self, from: data)
```

### 9. What Is Codable Protocol?

Type alias for `Encodable & Decodable`, used to serialize/deserialize JSON and other formats.

### 10. Different Types of XML Parsers

* SAX (event-based): `XMLParser`
* DOM (tree-based): third-party libs

### 11. Experience With CI/CD

Used GitHub Actions, Jenkins, and Bitrise to automate build, test, and deploy pipelines for enterprise apps.

### 12. What Is Fastlane?

A tool to automate builds, screenshots, test uploads, provisioning, and App Store deployment.

### 13. What Is Static Code Analyzer?

Tool that checks code for bugs, conventions, or performance issues without executing it. (e.g., SwiftLint, SonarQube)

### 14. Experience With SwiftUI

Used for building reactive UIs, supporting accessibility, animations, and modular layouts in modern apps.

### 15. Experience With Combine

Used to bind ViewModel to UI, transform API streams, debounce inputs, and manage state changes.

### 16. Third-Party Libraries Used

* Alamofire, SDWebImage, Firebase, Realm, SnapKit, IQKeyboardManager, SwiftyJSON, Lottie

### 17. How To Integrate 3rd Party Libraries?

* CocoaPods: `pod install`
* Swift Package Manager: via Xcode > File > Add Packages
* Carthage: `carthage update`

### 18. CocoaPods vs Carthage vs SPM

| Tool      | Pros                       | Cons                           |
| --------- | -------------------------- | ------------------------------ |
| CocoaPods | Easy to use                | Modifies Xcode project         |
| Carthage  | Binary builds, lightweight | Manual integration             |
| SPM       | Native Xcode support       | Less mature for complex setups |

### 19. How To Do Dependency Injection

Pass dependencies via initializer or property. Makes code testable and loosely coupled.

```swift
class ViewModel {
  let service: APIService
  init(service: APIService) { self.service = service }
}
```

### 20. What Is Deep Linking?

Custom URL scheme to launch app and open a specific screen.

### 21. What Is Universal Linking?

Apple’s system to open links in-app or fallback to Safari (uses `apple-app-site-association` file).

### 22. What Is Accessibility?

Making the app usable for all users using VoiceOver, Dynamic Type, color contrast, etc.

### 23. Apple Push Notification Steps

* Get permission → Get device token → Send to backend → Push from APNs using token

### 24. Best Practices While Code Reviewing or Coding

* Follow conventions
* Avoid force unwraps
* Ensure separation of concerns
* Write unit tests
* Leave helpful comments

### 25. `setNeedsLayout` vs `setNeedsUpdateConstraints`

* `setNeedsLayout()`: marks view to re-layout its subviews
* `setNeedsUpdateConstraints()`: triggers constraint update

### 26. Bluetooth and NFC in Background

* Requires proper background modes in `Info.plist`
* Limited execution and time windows

### 27. Different Payment Gateways in iOS

Stripe, Braintree, Razorpay, PayPal SDK

### 28. What Is Apple Pay?

Secure in-app and web payment method using Face ID/Touch ID. Requires Wallet setup and merchant ID.

### 29. What You Look for in Code Reviews

* Code clarity and readability
* Test coverage
* Adherence to architecture
* Memory safety (retain cycles, unowned/weak)

### 30. Content Hugging vs Compression Resistance

* **Content Hugging**: View resists growing beyond intrinsic size
* **Compression Resistance**: Resists shrinking below intrinsic size

### 31. Reactive Programming – Pros and Cons

**Pros**: Declarative, easy to manage state
**Cons**: Learning curve, can overcomplicate simple flows

### 32. CocoaPods vs Carthage

Answered in #18

### 33. Native vs React Native

* **Native**: Best performance, full SDK access
* **React Native**: Faster cross-platform dev, JS-based, slower performance

### 34. What Is Protocol-Oriented Programming?

Designing systems using protocols and value types. Encourages composition over inheritance.

```swift
protocol Drivable { func drive() }
struct Car: Drivable { func drive() { print("Driving") } }
```

