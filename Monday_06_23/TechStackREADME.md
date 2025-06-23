

---

### 🛠️ **Languages & Frameworks**

* **Swift**: Primary language for iOS development. Clean, type-safe, fast.
  *Use for*: all app logic, UI, networking, data handling.

* **Objective-C**: Older iOS language, still used in legacy codebases.
  *Use when*: working on or integrating with older apps.

* **SwiftUI**: Declarative UI framework. Write less code, preview live.
  *Use for*: modern UIs, reactive views, prototyping fast.

* **UIKit**: Imperative UI framework (older than SwiftUI).
  *Use for*: full control, mature apps, advanced UI behavior.

* **Combine**: Apple’s reactive framework for handling events, data streams, and bindings.
  *Use for*: reacting to network calls, form changes, UI state.

* **MVVM / MVVM-C / MVC**: Design patterns for separating logic.
  *Use for*: clean architecture, better testability, separation of concerns.

---

### 🌐 **Networking & APIs**

* **URLSession**: Apple's native API for making network calls.
  *Use for*: downloading data, REST API calls, file uploads.

* **NSURLConnection**: Deprecated. Only used in legacy Objective-C code.

* **RESTful APIs**: Backend APIs using HTTP (GET, POST, etc.)
  *Use for*: sending/receiving data to/from servers.

* **WebSockets**: Protocol for two-way, real-time communication.
  *Use for*: live chat, telemetry, stock tickers.

* **JSON**: Data format for APIs.
  *Use for*: parsing responses using `Codable`.

* **Token Authentication**: Use bearer tokens to authenticate API calls.
  *Use for*: secured endpoints; implement token refresh logic.

* **Deep Linking**: Opens app to specific content via URL.
  *Use for*: marketing links, push notifications.

* **Internationalization APIs**: APIs for supporting multiple languages and locales.
  *Use for*: making your app global-ready.

---

### 🔐 **Security & Privacy**

* **Keychain Services**: Secure storage for sensitive data (tokens, passwords).
  *Use for*: storing login tokens securely.

* **Face ID / Touch ID**: Biometric login via `LocalAuthentication`.
  *Use for*: unlocking apps, authorizing transactions.

* **LocalAuthentication**: API for checking biometric availability and triggering auth.
  *Use for*: integrating biometrics securely.

* **SOC 2 / FFIEC**: Compliance standards in fintech.
  *Use for*: informing security and privacy design; not code-level but team-wide.

---

### 📍 **Location & Device**

* **CoreLocation**: Get device GPS data.
  *Use for*: tracking, directions, nearby searches.

* **MapKit**: Display maps, annotations, routes.
  *Use for*: navigation, location display.

* **CoreBluetooth / BLE**: Communicate with Bluetooth-enabled devices.
  *Use for*: smart locks, wearables, vehicle proximity.

* **HealthKit**: Access health data with permission.
  *Use for*: fitness and wellness apps.

---

### 📦 **Persistence & Data**

* **CoreData**: Local database solution with object graph management.
  *Use for*: offline storage, syncing models with views.

---

### 🔔 **Notifications & Background Tasks**

* **APNs (Push Notifications)**: Send messages from server to device.
  *Use for*: alerts, updates, reminders.

* **Local Notifications**: Triggered on-device, scheduled by the app.
  *Use for*: reminders, timers, offline alerts.

* **Background Processing / Prefetching**: APIs like `BackgroundTasks` or `UITableViewDataSourcePrefetching`.
  *Use for*: syncing in background, improving performance.

---

### 🧩 **Accessibility & UX**

* **ADA Compliance Standards**: Design principles to meet U.S. accessibility laws.
  *Use for*: inclusive UI (color contrast, screen reader support).

* **VoiceOver / Dynamic Type**: Built-in iOS features for visually impaired users.
  *Use for*: reading labels aloud, adjusting font sizes.

* **Accessibility APIs**: APIs to label elements, control VoiceOver, add traits.
  *Use for*: making your app usable by all.

---

### ⚙️ **Tools & DevOps**

* **Xcode**: Apple’s IDE for iOS development.
  *Use for*: writing code, debugging, UI design, testing.

* **Git**: Version control system.
  *Use for*: collaborating, branching, rollback.

* **CI/CD**: Continuous Integration/Delivery pipelines (e.g., Jenkins, GitHub Actions).
  *Use for*: automating builds, tests, releases.

---

### 🧠 **Development Practices**

* **Agile / Scrum**: Project management styles.
  *Use for*: iterative development, sprint planning, team velocity.

---


Here are **examples for each major iOS concept** you mentioned—short and practical Swift code snippets to help you understand how to use them:

---

## 🛠️ Languages & Frameworks

### **Swift**

```swift
let message = "Hello, Swift!"
print(message)
```

### **SwiftUI**

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
    }
}
```

### **UIKit**

```swift
let label = UILabel()
label.text = "Hello, UIKit!"
```

### **Combine**

```swift
import Combine

let publisher = Just("Hello")
let subscription = publisher.sink { value in
    print(value)
}
```

### **MVVM Example**

```swift
class ViewModel: ObservableObject {
    @Published var count = 0
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            Text("Count: \(viewModel.count)")
            Button("Increment") {
                viewModel.count += 1
            }
        }
    }
}
```

---

## 🌐 Networking & APIs

### **URLSession**

```swift
let url = URL(string: "https://api.example.com/data")!
URLSession.shared.dataTask(with: url) { data, response, error in
    if let data = data {
        print(String(data: data, encoding: .utf8)!)
    }
}.resume()
```

### **REST API + JSON Decoding**

```swift
struct User: Codable { let id: Int; let name: String }
let jsonData = """
{ "id": 1, "name": "Hasan" }
""".data(using: .utf8)!

let user = try! JSONDecoder().decode(User.self, from: jsonData)
print(user.name)
```

### **WebSocket (URLSession)**

```swift
let socket = URLSession.shared.webSocketTask(with: URL(string: "wss://echo.websocket.org")!)
socket.resume()
socket.send(.string("Hello WebSocket")) { error in print(error ?? "Sent") }
```

### **Deep Linking**

```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    print("Opened from URL: \(url)")
    return true
}
```

---

## 🔐 Security

### **Keychain (with KeychainAccess)**

```swift
import KeychainAccess
let keychain = Keychain(service: "com.example.myapp")
keychain["token"] = "secure_token_here"
```

### **LocalAuthentication**

```swift
import LocalAuthentication

let context = LAContext()
context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Unlock") { success, error in
    print(success ? "Authenticated" : "Failed")
}
```

---

## 📍 Location & Map

### **CoreLocation**

```swift
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
}
```

### **MapKit**

```swift
import MapKit

let mapView = MKMapView()
mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                                     span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: true)
```

---

## 📦 Data Persistence

### **CoreData**

```swift
let entity = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
entity.setValue("Hasan", forKey: "name")
try? context.save()
```

---

## 🔔 Notifications

### **Local Notification**

```swift
let content = UNMutableNotificationContent()
content.title = "Reminder"
content.body = "Don’t forget to check in!"

let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
UNUserNotificationCenter.current().add(request)
```

---

## 🧩 Accessibility

### **Dynamic Type**

```swift
let label = UILabel()
label.font = UIFont.preferredFont(forTextStyle: .body)
label.adjustsFontForContentSizeCategory = true
```

### **VoiceOver Label**

```swift
let button = UIButton()
button.accessibilityLabel = "Submit Form"
```

---

## ⚙️ Tools & DevOps

### **Git (Terminal)**

```bash
git init
git add .
git commit -m "Initial commit"
```

### **Xcode CI/CD Example (Fastlane)**

```bash
fastlane beta
```

---


