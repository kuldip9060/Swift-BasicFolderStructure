//
//  OrderDetailModel.swift
//
//  Created by Appuno Solutions on 22/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class OrderDetailModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let histories = "histories"
    static let paymentAddress = "payment_address"
    static let orderId = "order_id"
    static let dateAdded = "date_added"
    static let paymentMethod = "payment_method"
    static let totals = "totals"
    static let invoiceNo = "invoice_no"
    static let comment = "comment"
    static let products = "products"
    static let shippingMethod = "shipping_method"
    static let vouchers = "vouchers"
    static let shippingAddress = "shipping_address"
  }

  // MARK: Properties
  public var histories: [Histories]?
  public var paymentAddress: String?
  public var orderId: String?
  public var dateAdded: String?
  public var paymentMethod: String?
  public var totals: [Totals]?
  public var invoiceNo: String?
  public var comment: String?
  public var products: [Products]?
  public var shippingMethod: String?
  public var vouchers: [Any]?
  public var shippingAddress: String?

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
    if let items = json[SerializationKeys.histories].array { histories = items.map { Histories(json: $0) } }
    paymentAddress = json[SerializationKeys.paymentAddress].string
    orderId = json[SerializationKeys.orderId].string
    dateAdded = json[SerializationKeys.dateAdded].string
    paymentMethod = json[SerializationKeys.paymentMethod].string
    if let items = json[SerializationKeys.totals].array { totals = items.map { Totals(json: $0) } }
    invoiceNo = json[SerializationKeys.invoiceNo].string
    comment = json[SerializationKeys.comment].string
    if let items = json[SerializationKeys.products].array { products = items.map { Products(json: $0) } }
    shippingMethod = json[SerializationKeys.shippingMethod].string
    if let items = json[SerializationKeys.vouchers].array { vouchers = items.map { $0.object} }
    shippingAddress = json[SerializationKeys.shippingAddress].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = histories { dictionary[SerializationKeys.histories] = value.map { $0.dictionaryRepresentation() } }
    if let value = paymentAddress { dictionary[SerializationKeys.paymentAddress] = value }
    if let value = orderId { dictionary[SerializationKeys.orderId] = value }
    if let value = dateAdded { dictionary[SerializationKeys.dateAdded] = value }
    if let value = paymentMethod { dictionary[SerializationKeys.paymentMethod] = value }
    if let value = totals { dictionary[SerializationKeys.totals] = value.map { $0.dictionaryRepresentation() } }
    if let value = invoiceNo { dictionary[SerializationKeys.invoiceNo] = value }
    if let value = comment { dictionary[SerializationKeys.comment] = value }
    if let value = products { dictionary[SerializationKeys.products] = value.map { $0.dictionaryRepresentation() } }
    if let value = shippingMethod { dictionary[SerializationKeys.shippingMethod] = value }
    if let value = vouchers { dictionary[SerializationKeys.vouchers] = value }
    if let value = shippingAddress { dictionary[SerializationKeys.shippingAddress] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.histories = aDecoder.decodeObject(forKey: SerializationKeys.histories) as? [Histories]
    self.paymentAddress = aDecoder.decodeObject(forKey: SerializationKeys.paymentAddress) as? String
    self.orderId = aDecoder.decodeObject(forKey: SerializationKeys.orderId) as? String
    self.dateAdded = aDecoder.decodeObject(forKey: SerializationKeys.dateAdded) as? String
    self.paymentMethod = aDecoder.decodeObject(forKey: SerializationKeys.paymentMethod) as? String
    self.totals = aDecoder.decodeObject(forKey: SerializationKeys.totals) as? [Totals]
    self.invoiceNo = aDecoder.decodeObject(forKey: SerializationKeys.invoiceNo) as? String
    self.comment = aDecoder.decodeObject(forKey: SerializationKeys.comment) as? String
    self.products = aDecoder.decodeObject(forKey: SerializationKeys.products) as? [Products]
    self.shippingMethod = aDecoder.decodeObject(forKey: SerializationKeys.shippingMethod) as? String
    self.vouchers = aDecoder.decodeObject(forKey: SerializationKeys.vouchers) as? [Any]
    self.shippingAddress = aDecoder.decodeObject(forKey: SerializationKeys.shippingAddress) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(histories, forKey: SerializationKeys.histories)
    aCoder.encode(paymentAddress, forKey: SerializationKeys.paymentAddress)
    aCoder.encode(orderId, forKey: SerializationKeys.orderId)
    aCoder.encode(dateAdded, forKey: SerializationKeys.dateAdded)
    aCoder.encode(paymentMethod, forKey: SerializationKeys.paymentMethod)
    aCoder.encode(totals, forKey: SerializationKeys.totals)
    aCoder.encode(invoiceNo, forKey: SerializationKeys.invoiceNo)
    aCoder.encode(comment, forKey: SerializationKeys.comment)
    aCoder.encode(products, forKey: SerializationKeys.products)
    aCoder.encode(shippingMethod, forKey: SerializationKeys.shippingMethod)
    aCoder.encode(vouchers, forKey: SerializationKeys.vouchers)
    aCoder.encode(shippingAddress, forKey: SerializationKeys.shippingAddress)
  }

}
