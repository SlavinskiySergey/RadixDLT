import Foundation
import Models

extension User: UserDefaultsStorable {
  public static var key: String {
    "UserKey"
  }
}
