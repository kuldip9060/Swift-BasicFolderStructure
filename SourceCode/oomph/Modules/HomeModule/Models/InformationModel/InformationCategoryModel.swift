//
//  InformationCategoryModel.swift
//
//  Created by Appuno Solutions on 06/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class InformationCategoryModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let column = "column"
    static let categoryId = "category_id"
    static let children = "children"
  }

  // MARK: Properties
  public var name: String?
  public var column: String?
  public var categoryId: String?
  public var children: [Any]?

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
    name = json[SerializationKeys.name].string
    column = json[SerializationKeys.column].string
    categoryId = json[SerializationKeys.categoryId].string
    if let items = json[SerializationKeys.children].array { children = items.map { $0.object} }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = column { dictionary[SerializationKeys.column] = value }
    if let value = categoryId { dictionary[SerializationKeys.categoryId] = value }
    if let value = children { dictionary[SerializationKeys.children] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.column = aDecoder.decodeObject(forKey: SerializationKeys.column) as? String
    self.categoryId = aDecoder.decodeObject(forKey: SerializationKeys.categoryId) as? String
    self.children = aDecoder.decodeObject(forKey: SerializationKeys.children) as? [Any]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(column, forKey: SerializationKeys.column)
    aCoder.encode(categoryId, forKey: SerializationKeys.categoryId)
    aCoder.encode(children, forKey: SerializationKeys.children)
  }

}
