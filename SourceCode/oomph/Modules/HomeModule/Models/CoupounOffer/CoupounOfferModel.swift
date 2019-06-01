//
//  CoupounOfferModel.swift
//
//  Created by Appuno Solutions on 24/04/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CoupounOfferModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let discount = "discount"
    static let dateEnd = "date_end"
    static let type = "type"
    static let dateStart = "date_start"
    static let logged = "logged"
    static let status = "status"
    static let usesCustomer = "uses_customer"
    static let couponId = "coupon_id"
    static let dateAdded = "date_added"
    static let code = "code"
    static let total = "total"
    static let shipping = "shipping"
    static let usesTotal = "uses_total"
  }

  // MARK: Properties
  public var name: String?
  public var discount: String?
  public var dateEnd: String?
  public var type: String?
  public var dateStart: String?
  public var logged: String?
  public var status: String?
  public var usesCustomer: String?
  public var couponId: String?
  public var dateAdded: String?
  public var code: String?
  public var total: String?
  public var shipping: String?
  public var usesTotal: String?

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
    discount = json[SerializationKeys.discount].string
    dateEnd = json[SerializationKeys.dateEnd].string
    type = json[SerializationKeys.type].string
    dateStart = json[SerializationKeys.dateStart].string
    logged = json[SerializationKeys.logged].string
    status = json[SerializationKeys.status].string
    usesCustomer = json[SerializationKeys.usesCustomer].string
    couponId = json[SerializationKeys.couponId].string
    dateAdded = json[SerializationKeys.dateAdded].string
    code = json[SerializationKeys.code].string
    total = json[SerializationKeys.total].string
    shipping = json[SerializationKeys.shipping].string
    usesTotal = json[SerializationKeys.usesTotal].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = discount { dictionary[SerializationKeys.discount] = value }
    if let value = dateEnd { dictionary[SerializationKeys.dateEnd] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = dateStart { dictionary[SerializationKeys.dateStart] = value }
    if let value = logged { dictionary[SerializationKeys.logged] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = usesCustomer { dictionary[SerializationKeys.usesCustomer] = value }
    if let value = couponId { dictionary[SerializationKeys.couponId] = value }
    if let value = dateAdded { dictionary[SerializationKeys.dateAdded] = value }
    if let value = code { dictionary[SerializationKeys.code] = value }
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = shipping { dictionary[SerializationKeys.shipping] = value }
    if let value = usesTotal { dictionary[SerializationKeys.usesTotal] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.discount = aDecoder.decodeObject(forKey: SerializationKeys.discount) as? String
    self.dateEnd = aDecoder.decodeObject(forKey: SerializationKeys.dateEnd) as? String
    self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? String
    self.dateStart = aDecoder.decodeObject(forKey: SerializationKeys.dateStart) as? String
    self.logged = aDecoder.decodeObject(forKey: SerializationKeys.logged) as? String
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    self.usesCustomer = aDecoder.decodeObject(forKey: SerializationKeys.usesCustomer) as? String
    self.couponId = aDecoder.decodeObject(forKey: SerializationKeys.couponId) as? String
    self.dateAdded = aDecoder.decodeObject(forKey: SerializationKeys.dateAdded) as? String
    self.code = aDecoder.decodeObject(forKey: SerializationKeys.code) as? String
    self.total = aDecoder.decodeObject(forKey: SerializationKeys.total) as? String
    self.shipping = aDecoder.decodeObject(forKey: SerializationKeys.shipping) as? String
    self.usesTotal = aDecoder.decodeObject(forKey: SerializationKeys.usesTotal) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(discount, forKey: SerializationKeys.discount)
    aCoder.encode(dateEnd, forKey: SerializationKeys.dateEnd)
    aCoder.encode(type, forKey: SerializationKeys.type)
    aCoder.encode(dateStart, forKey: SerializationKeys.dateStart)
    aCoder.encode(logged, forKey: SerializationKeys.logged)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(usesCustomer, forKey: SerializationKeys.usesCustomer)
    aCoder.encode(couponId, forKey: SerializationKeys.couponId)
    aCoder.encode(dateAdded, forKey: SerializationKeys.dateAdded)
    aCoder.encode(code, forKey: SerializationKeys.code)
    aCoder.encode(total, forKey: SerializationKeys.total)
    aCoder.encode(shipping, forKey: SerializationKeys.shipping)
    aCoder.encode(usesTotal, forKey: SerializationKeys.usesTotal)
  }

}
