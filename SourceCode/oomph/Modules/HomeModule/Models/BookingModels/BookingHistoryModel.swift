//
//  BookingHistoryModel.swift
//
//  Created by Appuno Solutions on 16/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class BookingHistoryModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let contactPerson = "contact_person"
    static let latlong = "latlong"
    static let machineryName = "machinery_name"
    static let costAmount = "cost_amount"
    static let contactNumber = "contact_number"
    static let licenseNumber = "license_number"
    static let type = "type"
    static let costType = "cost_type"
    static let status = "status"
    static let deliveryTime = "delivery_time"
    static let bookingStatus = "booking_status"
    static let image = "image"
    static let companyName = "company_name"
    static let createdAt = "created_at"
    static let comment = "comment"
    static let userId = "user_id"
    static let deliveryLocation = "delivery_location"
    static let areaOrHour = "area_or_hour"
    static let bookingUserId = "booking_user_id"
    static let companyDetail = "company_detail"
  }

  // MARK: Properties
  public var bookingId: String?
  public var contactPerson: String?
  public var latlong: [String]?
  public var machineryName: String?
  public var costAmount: String?
  public var contactNumber: String?
  public var licenseNumber: String?
  public var type: String?
  public var costType: String?
  public var status: String?
  public var deliveryTime: String?
  public var bookingStatus: String?
  public var image: String?
  public var companyName: String?
  public var createdAt: String?
  public var comment: String?
  public var userId: String?
  public var deliveryLocation: String?
  public var areaOrHour: String?
  public var bookingUserId: String?
  public var companyDetail: String?

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
    bookingId = json[SerializationKeys.bookingId].string
    contactPerson = json[SerializationKeys.contactPerson].string
    if let items = json[SerializationKeys.latlong].array { latlong = items.map { $0.stringValue } }
    machineryName = json[SerializationKeys.machineryName].string
    costAmount = json[SerializationKeys.costAmount].string
    contactNumber = json[SerializationKeys.contactNumber].string
    licenseNumber = json[SerializationKeys.licenseNumber].string
    type = json[SerializationKeys.type].string
    costType = json[SerializationKeys.costType].string
    status = json[SerializationKeys.status].string
    deliveryTime = json[SerializationKeys.deliveryTime].string
    bookingStatus = json[SerializationKeys.bookingStatus].string
    image = json[SerializationKeys.image].string
    companyName = json[SerializationKeys.companyName].string
    createdAt = json[SerializationKeys.createdAt].string
    comment = json[SerializationKeys.comment].string
    userId = json[SerializationKeys.userId].string
    deliveryLocation = json[SerializationKeys.deliveryLocation].string
    areaOrHour = json[SerializationKeys.areaOrHour].string
    bookingUserId = json[SerializationKeys.bookingUserId].string
    companyDetail = json[SerializationKeys.companyDetail].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = contactPerson { dictionary[SerializationKeys.contactPerson] = value }
    if let value = latlong { dictionary[SerializationKeys.latlong] = value }
    if let value = machineryName { dictionary[SerializationKeys.machineryName] = value }
    if let value = costAmount { dictionary[SerializationKeys.costAmount] = value }
    if let value = contactNumber { dictionary[SerializationKeys.contactNumber] = value }
    if let value = licenseNumber { dictionary[SerializationKeys.licenseNumber] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = costType { dictionary[SerializationKeys.costType] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = deliveryTime { dictionary[SerializationKeys.deliveryTime] = value }
    if let value = bookingStatus { dictionary[SerializationKeys.bookingStatus] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = companyName { dictionary[SerializationKeys.companyName] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = comment { dictionary[SerializationKeys.comment] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = deliveryLocation { dictionary[SerializationKeys.deliveryLocation] = value }
    if let value = areaOrHour { dictionary[SerializationKeys.areaOrHour] = value }
    if let value = bookingUserId { dictionary[SerializationKeys.bookingUserId] = value }
    if let value = companyDetail { dictionary[SerializationKeys.companyDetail] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.bookingId = aDecoder.decodeObject(forKey: SerializationKeys.bookingId) as? String
    self.contactPerson = aDecoder.decodeObject(forKey: SerializationKeys.contactPerson) as? String
    self.latlong = aDecoder.decodeObject(forKey: SerializationKeys.latlong) as? [String]
    self.machineryName = aDecoder.decodeObject(forKey: SerializationKeys.machineryName) as? String
    self.costAmount = aDecoder.decodeObject(forKey: SerializationKeys.costAmount) as? String
    self.contactNumber = aDecoder.decodeObject(forKey: SerializationKeys.contactNumber) as? String
    self.licenseNumber = aDecoder.decodeObject(forKey: SerializationKeys.licenseNumber) as? String
    self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? String
    self.costType = aDecoder.decodeObject(forKey: SerializationKeys.costType) as? String
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    self.deliveryTime = aDecoder.decodeObject(forKey: SerializationKeys.deliveryTime) as? String
    self.bookingStatus = aDecoder.decodeObject(forKey: SerializationKeys.bookingStatus) as? String
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.companyName = aDecoder.decodeObject(forKey: SerializationKeys.companyName) as? String
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.comment = aDecoder.decodeObject(forKey: SerializationKeys.comment) as? String
    self.userId = aDecoder.decodeObject(forKey: SerializationKeys.userId) as? String
    self.deliveryLocation = aDecoder.decodeObject(forKey: SerializationKeys.deliveryLocation) as? String
    self.areaOrHour = aDecoder.decodeObject(forKey: SerializationKeys.areaOrHour) as? String
    self.bookingUserId = aDecoder.decodeObject(forKey: SerializationKeys.bookingUserId) as? String
    self.companyDetail = aDecoder.decodeObject(forKey: SerializationKeys.companyDetail) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(bookingId, forKey: SerializationKeys.bookingId)
    aCoder.encode(contactPerson, forKey: SerializationKeys.contactPerson)
    aCoder.encode(latlong, forKey: SerializationKeys.latlong)
    aCoder.encode(machineryName, forKey: SerializationKeys.machineryName)
    aCoder.encode(costAmount, forKey: SerializationKeys.costAmount)
    aCoder.encode(contactNumber, forKey: SerializationKeys.contactNumber)
    aCoder.encode(licenseNumber, forKey: SerializationKeys.licenseNumber)
    aCoder.encode(type, forKey: SerializationKeys.type)
    aCoder.encode(costType, forKey: SerializationKeys.costType)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(deliveryTime, forKey: SerializationKeys.deliveryTime)
    aCoder.encode(bookingStatus, forKey: SerializationKeys.bookingStatus)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(companyName, forKey: SerializationKeys.companyName)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(comment, forKey: SerializationKeys.comment)
    aCoder.encode(userId, forKey: SerializationKeys.userId)
    aCoder.encode(deliveryLocation, forKey: SerializationKeys.deliveryLocation)
    aCoder.encode(areaOrHour, forKey: SerializationKeys.areaOrHour)
    aCoder.encode(bookingUserId, forKey: SerializationKeys.bookingUserId)
    aCoder.encode(companyDetail, forKey: SerializationKeys.companyDetail)
  }

}
