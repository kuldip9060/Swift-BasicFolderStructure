//
//  Totals.swift
//
//  Created by Appuno Solutions on 22/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Totals: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let text = "text"
    static let title = "title"
  }

  // MARK: Properties
  public var text: String?
  public var title: String?

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
    text = json[SerializationKeys.text].string
    title = json[SerializationKeys.title].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = text { dictionary[SerializationKeys.text] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.text = aDecoder.decodeObject(forKey: SerializationKeys.text) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(text, forKey: SerializationKeys.text)
    aCoder.encode(title, forKey: SerializationKeys.title)
  }

}
