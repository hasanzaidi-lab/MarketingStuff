
---

# 🗃️ Data Persistence in iOS

### 1. How to Persist Data in iOS

* `UserDefaults`: small key-value storage
* `Keychain`: secure storage for sensitive data
* `Core Data`: object graph and persistence framework
* `SQLite`: lightweight relational database
* `Files`: save data in documents directory
* `Realm`, `Firebase`, or cloud storage

### 2. What Is UserDefaults?

A lightweight, persistent store for small pieces of data (e.g., login state, user preferences).

```swift
UserDefaults.standard.set(true, forKey: "isLoggedIn")
```

### 3. What Is Keychain?

Secure storage for sensitive data like tokens, passwords. Encrypted and managed by the system.

```swift
KeychainWrapper.standard.set("token123", forKey: "authToken")
```

### 4. What Is Core Data?

Apple’s object persistence framework for managing structured data using an object graph.

### 5. SQLite vs Core Data

| Feature     | SQLite             | Core Data                        |
| ----------- | ------------------ | -------------------------------- |
| Type        | SQL-based database | Object graph & persistence       |
| Flexibility | Manual queries     | Built-in model & change tracking |
| Performance | Fast for raw SQL   | Optimized with caching           |

### 6. Do You Know Realm?

Yes. Realm is an open-source mobile database with reactive features. Easier setup than Core Data.

```swift
let user = User()
user.name = "Hasan"
try! realm.write { realm.add(user) }
```

### 7. Experience With Firebase Realtime Database

Used for chat and live data apps. Syncs data in real-time across devices. NoSQL schema.

### 8. What Is Core Data Migration?

Process of updating the data model schema without losing existing user data. Uses Lightweight or Manual migration.

### 9. How to Achieve Concurrency in Core Data

Use multiple `NSManagedObjectContext`s with private queue concurrency and parent-child contexts.

```swift
let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
```

### 10. What Is Managed Object Context?

The workspace in Core Data for managing a set of objects. Handles changes, saving, and undo management.

### 11. What Is Managed Object?

An instance of an entity defined in your Core Data model, subclassing `NSManagedObject`.

### 12. How to Store Data Securely

* Use **Keychain** for credentials
* **Core Data + Encryption** for sensitive info
* Enable **NSFileProtection**

### 13. How to Improve Core Data Performance

* Batch fetch requests
* Use `NSFetchedResultsController`
* Use background contexts for writes
* Avoid faulting all objects
* Minimize relationship traversals

