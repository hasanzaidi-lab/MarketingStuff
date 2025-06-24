
---

# 🔐 Security in iOS

### 1. Security in iOS App

Includes secure data storage, encrypted communication, secure coding practices, jailbreak detection, biometric auth, and app transport security (ATS).

### 2. What Is Man-in-the-Middle (MitM) Attack, and How to Prevent It?

An attacker intercepts communication between app and server. Prevent using HTTPS, SSL pinning, ATS, and certificate validation.

### 3. What Is SSL Pinning?

Verifies the server's certificate against a pinned version in the app to prevent MitM attacks.

### 4. Types of SSL Pinning and Implementation

* **Certificate pinning**: store `.cer` file in bundle
* **Public key pinning**: extract and match public key

```swift
// Using URLSessionDelegate to implement pinning
func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge,
                completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
  // Validate certificate or public key here
}
```

### 5. What Is Code Obfuscation in iOS?

Hiding the logic/structure of source code to make reverse engineering difficult. Tools: Swift Shield, LLVM obfuscators.

### 6. What Is CryptoKit Framework?

Apple's framework for cryptographic operations like hashing, symmetric/asymmetric encryption.

```swift
let hash = SHA256.hash(data: Data("hello".utf8))
```

### 7. Biometric Authentication Data Save

Face ID/Touch ID doesn’t store data in app. Instead, it verifies user identity and returns success/failure via `LocalAuthentication`.

### 8. Identify Jailbroken Devices

Check for Cydia paths, ability to write outside sandbox, presence of jailbreak files.

```swift
if FileManager.default.fileExists(atPath: "/Applications/Cydia.app") {
  // Possibly jailbroken
}
```

### 9. How to Implement AES Encryption

Use CryptoKit or CommonCrypto:

```swift
let key = SymmetricKey(size: .bits256)
let sealedBox = try! AES.GCM.seal(data, using: key)
```

### 10. Where Do You Store Keys in Encryption?

Use **Keychain** or **Secure Enclave** for storing encryption keys securely.

### 11. Symmetric vs Asymmetric Encryption

| Type       | Key Usage                    | Use Case                    |
| ---------- | ---------------------------- | --------------------------- |
| Symmetric  | Same key for encrypt/decrypt | Fast, used in local data    |
| Asymmetric | Public/private key pair      | Secure key exchange, tokens |

Would you like to continue with **memory management**, **networking**, or **SwiftUI best practices** next?
