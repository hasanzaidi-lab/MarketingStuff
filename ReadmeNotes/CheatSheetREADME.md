
Here’s your **iOS Developer Mini Cheatsheet** — clean, categorized, and fast to reference:

---

## 🛠️ Languages & Architecture

* **[Swift](https://github.com/hasanzaidi-lab/MarketingStuff/blob/main/ReadmeNotes/SwiftReadme.md#-optionals)** – Main iOS programming language
  `let name = "Hasan"`

* **[SwiftUI](https://github.com/hasanzaidi-lab/MarketingStuff/blob/main/ReadmeNotes/SwiftUIReadme.md#-swiftui-fundamentals)** – Declarative UI

  ```swift
  Text("Hello, SwiftUI")
  ```

* **UIKit** – Imperative UI

  ```swift
  let label = UILabel()
  label.text = "UIKit"
  ```

* **Combine** – Reactive framework

  ```swift
  Just("Hi").sink { print($0) }
  ```

* **MVVM / MVVM-C** – Clean architecture

  * Model = data
  * ViewModel = logic
  * View = UI
  * Coordinator = navigation

---

## 🌐 Networking

* **URLSession**

  ```swift
  URLSession.shared.dataTask(with: url) { data, _, _ in }
  ```

* **JSON Decoding**

  ```swift
  let user = try? JSONDecoder().decode(User.self, from: data)
  ```

* **WebSockets**

  ```swift
  let socket = URLSession.shared.webSocketTask(with: url)
  socket.send(.string("Hi"))
  ```

* **Token Auth** – Send token in header
  `"Authorization: Bearer <token>"`

---

## 🔐 Security

* **Keychain**

  ```swift
  keychain["token"] = "secure_token"
  ```

* **Biometrics (Face ID / Touch ID)**

  ```swift
  context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics)
  ```

---

## 📍 Location & Map

* **CoreLocation**

  ```swift
  locationManager.startUpdatingLocation()
  ```

* **MapKit**

  ```swift
  mapView.setRegion(...)
  ```

* **BLE (CoreBluetooth)** – For smart devices like car keys

---

## 📦 Persistence

* **CoreData**

  ```swift
  context.save()
  ```

* **UserDefaults** – For small values

  ```swift
  UserDefaults.standard.set(true, forKey: "loggedIn")
  ```

---

## 🔔 Notifications

* **Local Notification**

  ```swift
  UNUserNotificationCenter.current().add(request)
  ```

* **Push Notification** – Sent from server via APNs

---

## 🧩 Accessibility

* **VoiceOver**

  ```swift
  button.accessibilityLabel = "Submit"
  ```

* **Dynamic Type**

  ```swift
  label.font = .preferredFont(forTextStyle: .body)
  ```

* **ADA Compliance** – Use contrast, labels, large tap areas

---

## ⚙️ Dev Tools

* **Xcode** – Main IDE

* **Git**

  ```bash
  git add . && git commit -m "message"
  ```

* **CI/CD** – Automate builds (Fastlane, GitHub Actions)

---

## 🧠 Dev Practices

* **Agile/Scrum** – Sprint-based, fast feedback
* **Testability** – Use MVVM + Combine to isolate and test logic
* **80/20 Rule** – Make 80% of app easy to test & maintain

---

