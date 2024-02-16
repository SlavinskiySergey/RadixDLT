import Foundation

public protocol UserDefaultsStorable: Codable {
  static var key: String { get }
}

public struct UserDefaultsClient {
  private let userDefaults: UserDefaults

  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
  }

  public func create<Model: UserDefaultsStorable>(model: Model) {
    guard let modelData = try? JSONEncoder().encode(model) else {
      return
    }
    userDefaults.set(modelData, forKey: Model.key)
  }

  public func delete<Model: UserDefaultsStorable>(modelType: Model.Type) {
    userDefaults.removeObject(forKey: modelType.key)
  }

  public func read<Model: UserDefaultsStorable>() -> Model? {
    guard let modelData = userDefaults.data(forKey: Model.key) else {
      return nil
    }
    return try? JSONDecoder().decode(Model.self, from: modelData)
  }
}
