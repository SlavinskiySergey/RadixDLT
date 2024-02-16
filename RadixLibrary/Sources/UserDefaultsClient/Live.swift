import Dependencies
import Foundation

extension DependencyValues {
  public var userDefaultsClient: UserDefaultsClient {
    get { self[UserDefaultsClient.self] }
    set { self[UserDefaultsClient.self] = newValue }
  }
}

extension UserDefaultsClient: DependencyKey {
  public static let liveValue: Self = {
    return Self(userDefaults: .standard)
  }()
}
