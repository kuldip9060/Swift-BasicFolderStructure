//
//  SavedArticleModel.swift
//
//  Created by Appuno Solutions on 07/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SavedArticleModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let productId = "product_id"
    static let name = "name"
    static let thumb = "thumb"
    static let special = "special"
    static let model = "model"
    static let stock = "stock"
    static let price = "price"
  }

  // MARK: Properties
  public var productId: String?
  public var name: String?
  public var thumb: String?
  public var special: Bool? = false
  public var model: String?
  public var stock: String?
  public var price: String?

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
    productId = json[SerializationKeys.productId].string
    name = json[SerializationKeys.name].string
    thumb = json[SerializationKeys.thumb].string
    special = json[SerializationKeys.special].boolValue
    model = json[SerializationKeys.model].string
    stock = json[SerializationKeys.stock].string
    price = json[SerializationKeys.price].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = productId { dictionary[SerializationKeys.productId] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = thumb { dictionary[SerializationKeys.thumb] = value }
    dictionary[SerializationKeys.special] = special
    if let value = model { dictionary[SerializationKeys.model] = value }
    if let value = stock { dictionary[SerializationKeys.stock] = value }
    if let value = price { dictionary[SerializationKeys.price] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.productId = aDecoder.decodeObject(forKey: SerializationKeys.productId) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.thumb = aDecoder.decodeObject(forKey: SerializationKeys.thumb) as? String
    self.special = aDecoder.decodeBool(forKey: SerializationKeys.special)
    self.model = aDecoder.decodeObject(forKey: SerializationKeys.model) as? String
    self.stock = aDecoder.decodeObject(forKey: SerializationKeys.stock) as? String
    self.price = aDecoder.decodeObject(forKey: SerializationKeys.price) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(productId, forKey: SerializationKeys.productId)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(thumb, forKey: SerializationKeys.thumb)
    aCoder.encode(special, forKey: SerializationKeys.special)
    aCoder.encode(model, forKey: SerializationKeys.model)
    aCoder.encode(stock, forKey: SerializationKeys.stock)
    aCoder.encode(price, forKey: SerializationKeys.price)
  }

}
