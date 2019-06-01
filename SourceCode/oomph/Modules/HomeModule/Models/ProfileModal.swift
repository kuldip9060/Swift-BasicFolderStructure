//
//  ProfileModal.swift
//
//  Created by Appuno Solutions on 22/04/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct ProfileModal {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let newsletter = "newsletter"
    static let status = "status"
    static let customerGroupId = "customer_group_id"
    static let firstname = "firstname"
    static let lastname = "lastname"
    static let email = "email"
    static let fax = "fax"
    static let addressId = "address_id"
    static let customerId = "customer_id"
    static let telephone = "telephone"
  }

  // MARK: Properties
  public var newsletter: String?
  public var status: String?
  public var customerGroupId: String?
  public var firstname: String?
  public var lastname: String?
  public var email: String?
  public var fax: String?
  public var addressId: String?
  public var customerId: String?
  public var telephone: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public init(json: JSON) {
    newsletter = json[SerializationKeys.newsletter].string
    status = json[SerializationKeys.status].string
    customerGroupId = json[SerializationKeys.customerGroupId].string
    firstname = json[SerializationKeys.firstname].string
    lastname = json[SerializationKeys.lastname].string
    email = json[SerializationKeys.email].string
    fax = json[SerializationKeys.fax].string
    addressId = json[SerializationKeys.addressId].string
    customerId = json[SerializationKeys.customerId].string
    telephone = json[SerializationKeys.telephone].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = newsletter { dictionary[SerializationKeys.newsletter] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = customerGroupId { dictionary[SerializationKeys.customerGroupId] = value }
    if let value = firstname { dictionary[SerializationKeys.firstname] = value }
    if let value = lastname { dictionary[SerializationKeys.lastname] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = fax { dictionary[SerializationKeys.fax] = value }
    if let value = addressId { dictionary[SerializationKeys.addressId] = value }
    if let value = customerId { dictionary[SerializationKeys.customerId] = value }
    if let value = telephone { dictionary[SerializationKeys.telephone] = value }
    return dictionary
  }

}
