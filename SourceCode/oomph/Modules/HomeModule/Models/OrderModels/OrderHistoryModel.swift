//
//  OrderHistoryModel.swift
//
//  Created by Appuno Solutions on 08/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class OrderHistoryModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let total = "total"
    static let status = "status"
    static let orderId = "order_id"
    static let dateAdded = "date_added"
    static let name = "name"
    static let products = "products"
  }

  // MARK: Properties
  public var total: String?
  public var status: String?
  public var orderId: String?
  public var dateAdded: String?
  public var name: String?
  public var products: Int?

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
    total = json[SerializationKeys.total].string
    status = json[SerializationKeys.status].string
    orderId = json[SerializationKeys.orderId].string
    dateAdded = json[SerializationKeys.dateAdded].string
    name = json[SerializationKeys.name].string
    products = json[SerializationKeys.products].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = orderId { dictionary[SerializationKeys.orderId] = value }
    if let value = dateAdded { dictionary[SerializationKeys.dateAdded] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = products { dictionary[SerializationKeys.products] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.total = aDecoder.decodeObject(forKey: SerializationKeys.total) as? String
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    self.orderId = aDecoder.decodeObject(forKey: SerializationKeys.orderId) as? String
    self.dateAdded = aDecoder.decodeObject(forKey: SerializationKeys.dateAdded) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.products = aDecoder.decodeObject(forKey: SerializationKeys.products) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(total, forKey: SerializationKeys.total)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(orderId, forKey: SerializationKeys.orderId)
    aCoder.encode(dateAdded, forKey: SerializationKeys.dateAdded)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(products, forKey: SerializationKeys.products)
  }

}
