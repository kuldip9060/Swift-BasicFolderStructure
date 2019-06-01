//
//  Products.swift
//
//  Created by Appuno Solutions on 22/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Products: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let seller = "seller"
    static let option = "option"
    static let name = "name"
    static let image = "image"
    static let total = "total"
    static let sellerId = "seller_id"
    static let quantity = "quantity"
    static let model = "model"
    static let download = "download"
    static let price = "price"
  }

  // MARK: Properties
  public var seller: String?
  public var option: [Any]?
  public var name: String?
  public var image: String?
  public var total: String?
  public var sellerId: String?
  public var quantity: String?
  public var model: String?
  public var download: [Any]?
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
    seller = json[SerializationKeys.seller].string
    if let items = json[SerializationKeys.option].array { option = items.map { $0.object} }
    name = json[SerializationKeys.name].string
    image = json[SerializationKeys.image].string
    total = json[SerializationKeys.total].string
    sellerId = json[SerializationKeys.sellerId].string
    quantity = json[SerializationKeys.quantity].string
    model = json[SerializationKeys.model].string
    if let items = json[SerializationKeys.download].array { download = items.map { $0.object} }
    price = json[SerializationKeys.price].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = seller { dictionary[SerializationKeys.seller] = value }
    if let value = option { dictionary[SerializationKeys.option] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = sellerId { dictionary[SerializationKeys.sellerId] = value }
    if let value = quantity { dictionary[SerializationKeys.quantity] = value }
    if let value = model { dictionary[SerializationKeys.model] = value }
    if let value = download { dictionary[SerializationKeys.download] = value }
    if let value = price { dictionary[SerializationKeys.price] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.seller = aDecoder.decodeObject(forKey: SerializationKeys.seller) as? String
    self.option = aDecoder.decodeObject(forKey: SerializationKeys.option) as? [Any]
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.total = aDecoder.decodeObject(forKey: SerializationKeys.total) as? String
    self.sellerId = aDecoder.decodeObject(forKey: SerializationKeys.sellerId) as? String
    self.quantity = aDecoder.decodeObject(forKey: SerializationKeys.quantity) as? String
    self.model = aDecoder.decodeObject(forKey: SerializationKeys.model) as? String
    self.download = aDecoder.decodeObject(forKey: SerializationKeys.download) as? [Any]
    self.price = aDecoder.decodeObject(forKey: SerializationKeys.price) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(seller, forKey: SerializationKeys.seller)
    aCoder.encode(option, forKey: SerializationKeys.option)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(total, forKey: SerializationKeys.total)
    aCoder.encode(sellerId, forKey: SerializationKeys.sellerId)
    aCoder.encode(quantity, forKey: SerializationKeys.quantity)
    aCoder.encode(model, forKey: SerializationKeys.model)
    aCoder.encode(download, forKey: SerializationKeys.download)
    aCoder.encode(price, forKey: SerializationKeys.price)
  }

}
