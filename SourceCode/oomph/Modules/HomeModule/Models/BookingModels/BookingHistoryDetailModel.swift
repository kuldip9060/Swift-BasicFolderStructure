//
//  BookingHistoryDetailModel.swift
//
//  Created by Appuno Solutions on 20/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class BookingHistoryDetailModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let invoice = "invoice"
    static let machineryName = "machinery_name"
    static let costAmount = "cost_amount"
    static let contactNumber = "contact_number"
    static let type = "type"
    static let deliveryTime = "delivery_time"
    static let image = "image"
    static let companyName = "company_name"
    static let comment = "comment"
    static let deliveryLocation = "delivery_location"
    static let areaOrHour = "area_or_hour"
    static let companyDetail = "company_detail"
    static let bookingId = "booking_id"
    static let contactPerson = "contact_person"
    static let updatedAt = "updated_at"
    static let latlong = "latlong"
    static let licenseNumber = "license_number"
    static let costType = "cost_type"
    static let status = "status"
    static let location = "location"
    static let totalCost = "total_cost"
    static let bookingStatus = "booking_status"
    static let createdAt = "created_at"
    static let userId = "user_id"
    static let bookingUserId = "booking_user_id"
  }

  // MARK: Properties
  //public var invoice: Invoice?
  public var machineryName: String?
  public var costAmount: String?
  public var contactNumber: String?
  public var type: String?
  public var deliveryTime: String?
  public var image: String?
  public var companyName: String?
  public var comment: String?
  public var deliveryLocation: String?
  public var areaOrHour: String?
  public var companyDetail: String?
  public var bookingId: String?
  public var contactPerson: String?
  public var updatedAt: String?
  public var latlong: String?
  public var licenseNumber: String?
  public var costType: String?
  public var status: String?
  public var location: String?
  public var totalCost: Int?
  public var bookingStatus: String?
  public var createdAt: String?
  public var userId: String?
  public var bookingUserId: String?

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
    //invoice = Invoice(json: json[SerializationKeys.invoice])
    machineryName = json[SerializationKeys.machineryName].string
    costAmount = json[SerializationKeys.costAmount].string
    contactNumber = json[SerializationKeys.contactNumber].string
    type = json[SerializationKeys.type].string
    deliveryTime = json[SerializationKeys.deliveryTime].string
    image = json[SerializationKeys.image].string
    companyName = json[SerializationKeys.companyName].string
    comment = json[SerializationKeys.comment].string
    deliveryLocation = json[SerializationKeys.deliveryLocation].string
    areaOrHour = json[SerializationKeys.areaOrHour].string
    companyDetail = json[SerializationKeys.companyDetail].string
    bookingId = json[SerializationKeys.bookingId].string
    contactPerson = json[SerializationKeys.contactPerson].string
    updatedAt = json[SerializationKeys.updatedAt].string
    latlong = json[SerializationKeys.latlong].string
    licenseNumber = json[SerializationKeys.licenseNumber].string
    costType = json[SerializationKeys.costType].string
    status = json[SerializationKeys.status].string
    location = json[SerializationKeys.location].string
    totalCost = json[SerializationKeys.totalCost].int
    bookingStatus = json[SerializationKeys.bookingStatus].string
    createdAt = json[SerializationKeys.createdAt].string
    userId = json[SerializationKeys.userId].string
    bookingUserId = json[SerializationKeys.bookingUserId].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    //if let value = invoice { dictionary[SerializationKeys.invoice] = value.dictionaryRepresentation() }
    if let value = machineryName { dictionary[SerializationKeys.machineryName] = value }
    if let value = costAmount { dictionary[SerializationKeys.costAmount] = value }
    if let value = contactNumber { dictionary[SerializationKeys.contactNumber] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = deliveryTime { dictionary[SerializationKeys.deliveryTime] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = companyName { dictionary[SerializationKeys.companyName] = value }
    if let value = comment { dictionary[SerializationKeys.comment] = value }
    if let value = deliveryLocation { dictionary[SerializationKeys.deliveryLocation] = value }
    if let value = areaOrHour { dictionary[SerializationKeys.areaOrHour] = value }
    if let value = companyDetail { dictionary[SerializationKeys.companyDetail] = value }
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = contactPerson { dictionary[SerializationKeys.contactPerson] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = latlong { dictionary[SerializationKeys.latlong] = value }
    if let value = licenseNumber { dictionary[SerializationKeys.licenseNumber] = value }
    if let value = costType { dictionary[SerializationKeys.costType] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = location { dictionary[SerializationKeys.location] = value }
    if let value = totalCost { dictionary[SerializationKeys.totalCost] = value }
    if let value = bookingStatus { dictionary[SerializationKeys.bookingStatus] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = bookingUserId { dictionary[SerializationKeys.bookingUserId] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    //self.invoice = aDecoder.decodeObject(forKey: SerializationKeys.invoice) as? Invoice
    self.machineryName = aDecoder.decodeObject(forKey: SerializationKeys.machineryName) as? String
    self.costAmount = aDecoder.decodeObject(forKey: SerializationKeys.costAmount) as? String
    self.contactNumber = aDecoder.decodeObject(forKey: SerializationKeys.contactNumber) as? String
    self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? String
    self.deliveryTime = aDecoder.decodeObject(forKey: SerializationKeys.deliveryTime) as? String
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.companyName = aDecoder.decodeObject(forKey: SerializationKeys.companyName) as? String
    self.comment = aDecoder.decodeObject(forKey: SerializationKeys.comment) as? String
    self.deliveryLocation = aDecoder.decodeObject(forKey: SerializationKeys.deliveryLocation) as? String
    self.areaOrHour = aDecoder.decodeObject(forKey: SerializationKeys.areaOrHour) as? String
    self.companyDetail = aDecoder.decodeObject(forKey: SerializationKeys.companyDetail) as? String
    self.bookingId = aDecoder.decodeObject(forKey: SerializationKeys.bookingId) as? String
    self.contactPerson = aDecoder.decodeObject(forKey: SerializationKeys.contactPerson) as? String
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.latlong = aDecoder.decodeObject(forKey: SerializationKeys.latlong) as? String
    self.licenseNumber = aDecoder.decodeObject(forKey: SerializationKeys.licenseNumber) as? String
    self.costType = aDecoder.decodeObject(forKey: SerializationKeys.costType) as? String
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    self.location = aDecoder.decodeObject(forKey: SerializationKeys.location) as? String
    self.totalCost = aDecoder.decodeObject(forKey: SerializationKeys.totalCost) as? Int
    self.bookingStatus = aDecoder.decodeObject(forKey: SerializationKeys.bookingStatus) as? String
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.userId = aDecoder.decodeObject(forKey: SerializationKeys.userId) as? String
    self.bookingUserId = aDecoder.decodeObject(forKey: SerializationKeys.bookingUserId) as? String
  }

  public func encode(with aCoder: NSCoder) {
    //aCoder.encode(invoice, forKey: SerializationKeys.invoice)
    aCoder.encode(machineryName, forKey: SerializationKeys.machineryName)
    aCoder.encode(costAmount, forKey: SerializationKeys.costAmount)
    aCoder.encode(contactNumber, forKey: SerializationKeys.contactNumber)
    aCoder.encode(type, forKey: SerializationKeys.type)
    aCoder.encode(deliveryTime, forKey: SerializationKeys.deliveryTime)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(companyName, forKey: SerializationKeys.companyName)
    aCoder.encode(comment, forKey: SerializationKeys.comment)
    aCoder.encode(deliveryLocation, forKey: SerializationKeys.deliveryLocation)
    aCoder.encode(areaOrHour, forKey: SerializationKeys.areaOrHour)
    aCoder.encode(companyDetail, forKey: SerializationKeys.companyDetail)
    aCoder.encode(bookingId, forKey: SerializationKeys.bookingId)
    aCoder.encode(contactPerson, forKey: SerializationKeys.contactPerson)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(latlong, forKey: SerializationKeys.latlong)
    aCoder.encode(licenseNumber, forKey: SerializationKeys.licenseNumber)
    aCoder.encode(costType, forKey: SerializationKeys.costType)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(location, forKey: SerializationKeys.location)
    aCoder.encode(totalCost, forKey: SerializationKeys.totalCost)
    aCoder.encode(bookingStatus, forKey: SerializationKeys.bookingStatus)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(userId, forKey: SerializationKeys.userId)
    aCoder.encode(bookingUserId, forKey: SerializationKeys.bookingUserId)
  }

}
