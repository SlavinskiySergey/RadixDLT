import Foundation

extension UserDefaultsClient {
  public static let mock = Self(
    userDefaults: UserDefaultsMock()
  )
}

public final class UserDefaultsMock: UserDefaults {
  private var storage: [String: Any] = [:]
  
  override public func bool(forKey defaultName: String) -> Bool {
    (storage[defaultName] as? Bool) ?? false
  }
  
  public override func set(_ value: Bool, forKey defaultName: String) {
    storage[defaultName] = bool
  }
  
  public override func data(forKey defaultName: String) -> Data? {
    storage[defaultName] as? Data
  }
  
  public override func set(_ value: Any?, forKey defaultName: String) {
    storage[defaultName] = value
  }
  
  override public func removeObject(forKey defaultName: String) {
    storage[defaultName] = nil
  }
}
