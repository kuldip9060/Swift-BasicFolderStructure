//
//  Histories.swift
//
//  Created by Appuno Solutions on 22/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Histories: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let comment = "comment"
    static let dateAdded = "date_added"
  }

  // MARK: Properties
  public var status: String?
  public var comment: String?
  public var dateAdded: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    status = json[SerializationKeys.status].string
    comment = json[SerializationKeys.comment].string
    dateAdded = json[SerializationKeys.dateAdded].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = comment { dictionary[SerializationKeys.comment] = value }
    if let value = dateAdded { dictionary[SerializationKeys.dateAdded] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    self.comment = aDecoder.decodeObject(forKey: SerializationKeys.comment) as? String
    self.dateAdded = aDecoder.decodeObject(forKey: SerializationKeys.dateAdded) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(comment, forKey: SerializationKeys.comment)
    aCoder.encode(dateAdded, forKey: SerializationKeys.dateAdded)
  }

}
