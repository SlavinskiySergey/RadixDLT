import Foundation

public struct User: Codable, Equatable {
  public let birthdate: Date
  public let name: String
  public let surname: String
  
  public init(
    birthdate: Date,
    name: String = "",
    surname: String = ""
  ) {
    self.birthdate = birthdate
    self.name = name
    self.surname = surname
  }
}
