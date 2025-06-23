
---

# 🧩 SwiftUI Fundamentals

### 1. What Is SwiftUI?

SwiftUI is Apple’s modern declarative UI framework introduced in iOS 13. It allows developers to design and manage UI using Swift code. Unlike UIKit, which requires imperative programming, SwiftUI describes the UI as a function of its state.

**Example:**

```swift
struct WelcomeView: View {
    var body: some View {
        Text("Welcome to SwiftUI!")
            .padding()
            .font(.title)
    }
}
```

### 2. Different Kinds of Bindings in SwiftUI

* `@State`: Stores local, view-owned state. Automatically triggers UI updates.

  ```swift
  @State private var counter = 0
  ```

* `@Binding`: Allows child view to mutate a `@State` from a parent.

  ```swift
  struct ChildView: View {
    @Binding var isOn: Bool
    var body: some View { Toggle("Enabled", isOn: $isOn) }
  }
  ```

* `@ObservedObject`: Watches an external object conforming to `ObservableObject`. Used for shared logic across views.

  ```swift
  class TimerModel: ObservableObject {
      @Published var seconds = 0
  }
  struct TimerView: View {
      @ObservedObject var model: TimerModel
  }
  ```

* `@StateObject`: Same as `@ObservedObject`, but the view owns and initializes the object.

  ```swift
  @StateObject var model = TimerModel()
  ```

* `@EnvironmentObject`: Injected object that is shared app-wide.

  ```swift
  struct ProfileView: View {
      @EnvironmentObject var userSettings: UserSettings
  }
  ```

### 3. `@State` vs `@ObservedObject` vs `@StateObject` vs `@EnvironmentObject`

| Property Wrapper     | Ownership         | Scope              | Use Case                                  |
| -------------------- | ----------------- | ------------------ | ----------------------------------------- |
| `@State`             | View owns         | Local view only    | Counter, toggles, UI states               |
| `@ObservedObject`    | External object   | Passed from parent | Shared model, reused logic                |
| `@StateObject`       | View creates/owns | New in iOS 14+     | View instantiates its own model           |
| `@EnvironmentObject` | Global injection  | Across many views  | App-wide shared data (e.g. user settings) |

### 4. What Is GeometryReader?

A layout tool that provides access to container view’s size and coordinates.

**Use Case:** Build responsive designs.

```swift
GeometryReader { geometry in
  Text("Width: \(geometry.size.width)")
    .frame(width: geometry.size.width / 2)
}
```

### 5. What Are View Modifiers?

They are chainable functions that modify views’ appearance and behavior.

```swift
Text("Styled")
  .foregroundColor(.white)
  .background(Color.blue)
  .font(.headline)
  .padding()
```

### 6. What Are View Builders?

Closures that return views. Used in layout containers and declarative syntax.

```swift
VStack {
  Text("Line 1")
  Text("Line 2")
}
```

They power DSL-like syntax in SwiftUI.

### 7. Challenges Faced in SwiftUI

* **Debugging**: Hard to trace issues due to unclear error logs.
* **Layout Issues**: Misalignment due to `Spacer`/frame conflicts.
* **Navigation**: Complex for deep links and programmatic flows.
* **iOS version support**: Some APIs are only available in newer versions.

### 8. Difference Between UIKit and SwiftUI

| Feature         | UIKit               | SwiftUI                |
| --------------- | ------------------- | ---------------------- |
| Paradigm        | Imperative          | Declarative            |
| Code Complexity | Verbose             | Concise                |
| Preview         | Manual              | Live Preview (Canvas)  |
| Compatibility   | Mature, flexible    | Still maturing         |
| Animations      | Manual              | Automatic, declarative |
| Testing         | UI Tests (XCUITest) | Preview + UI Tests     |

### 9. How to Use SwiftUI in UIKit

Wrap SwiftUI in `UIHostingController`:

```swift
let vc = UIHostingController(rootView: ContentView())
self.present(vc, animated: true)
```

### 10. How to Use UIKit in SwiftUI

Use `UIViewRepresentable` to wrap UIKit views:

```swift
struct UIKitLabel: UIViewRepresentable {
  func makeUIView(context: Context) -> UILabel {
    let label = UILabel()
    label.text = "UIKit Label"
    return label
  }
  func updateUIView(_ uiView: UILabel, context: Context) {}
}
```


