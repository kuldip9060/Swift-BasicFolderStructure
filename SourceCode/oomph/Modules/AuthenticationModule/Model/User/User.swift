//
//  User.swift
//
//  Created by Ronak on 01/06/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class User: NSObject,NSCoding {

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
        
        //seller
        static let sellerGroupId = "seller_group_id"
        static let approved = "approved"
        static let sellerId = "seller_id"
        static let username = "username"
        //static let error = "error"
        
        static let isSeller = "isSeller"
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
    
    public var sellerGroupId: String?
    public var approved: String?
    public var sellerId: String?
    public var username: String?
    //public var error: Bool? = false
    
    public var isSeller : Bool? = false
    public var isFirstTimeHomeScreen : Bool? = false

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
        
        sellerGroupId = json[SerializationKeys.sellerGroupId].string
        approved = json[SerializationKeys.approved].string
        sellerId = json[SerializationKeys.sellerId].string
        username = json[SerializationKeys.username].string
        //error = json[SerializationKeys.error].boolValue
        isSeller = json[SerializationKeys.isSeller].boolValue
        

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
        
        if let value = sellerGroupId { dictionary[SerializationKeys.sellerGroupId] = value }
        if let value = approved { dictionary[SerializationKeys.approved] = value }
        if let value = sellerId { dictionary[SerializationKeys.sellerId] = value }
        if let value = username { dictionary[SerializationKeys.username] = value }
        //dictionary[SerializationKeys.error] = error
        dictionary[SerializationKeys.isSeller] = isSeller
        
        return dictionary
    }

  // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.newsletter = aDecoder.decodeObject(forKey: SerializationKeys.newsletter) as? String
        self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
        self.customerGroupId = aDecoder.decodeObject(forKey: SerializationKeys.customerGroupId) as? String
        self.firstname = aDecoder.decodeObject(forKey: SerializationKeys.firstname) as? String
        self.lastname = aDecoder.decodeObject(forKey: SerializationKeys.lastname) as? String
        self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
        self.fax = aDecoder.decodeObject(forKey: SerializationKeys.fax) as? String
        self.addressId = aDecoder.decodeObject(forKey: SerializationKeys.addressId) as? String
        self.customerId = aDecoder.decodeObject(forKey: SerializationKeys.customerId) as? String
        self.telephone = aDecoder.decodeObject(forKey: SerializationKeys.telephone) as? String
        
        self.sellerGroupId = aDecoder.decodeObject(forKey: SerializationKeys.sellerGroupId) as? String
        self.approved = aDecoder.decodeObject(forKey: SerializationKeys.approved) as? String
        self.sellerId = aDecoder.decodeObject(forKey: SerializationKeys.sellerId) as? String
        self.username = aDecoder.decodeObject(forKey: SerializationKeys.username) as? String
        //self.error = aDecoder.decodeBool(forKey: SerializationKeys.error)
        self.isSeller = aDecoder.decodeObject(forKey: SerializationKeys.isSeller) as? Bool
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(newsletter, forKey: SerializationKeys.newsletter)
        aCoder.encode(status, forKey: SerializationKeys.status)
        aCoder.encode(customerGroupId, forKey: SerializationKeys.customerGroupId)
        aCoder.encode(firstname, forKey: SerializationKeys.firstname)
        aCoder.encode(lastname, forKey: SerializationKeys.lastname)
        aCoder.encode(email, forKey: SerializationKeys.email)
        aCoder.encode(fax, forKey: SerializationKeys.fax)
        aCoder.encode(addressId, forKey: SerializationKeys.addressId)
        aCoder.encode(customerId, forKey: SerializationKeys.customerId)
        aCoder.encode(telephone, forKey: SerializationKeys.telephone)
        
        aCoder.encode(sellerGroupId, forKey: SerializationKeys.sellerGroupId)
        aCoder.encode(approved, forKey: SerializationKeys.approved)
        aCoder.encode(sellerId, forKey: SerializationKeys.sellerId)
        aCoder.encode(username, forKey: SerializationKeys.username)
        //aCoder.encode(error, forKey: SerializationKeys.error)
        aCoder.encode(isSeller, forKey: SerializationKeys.isSeller)
    }

    class func loadLoggedInUser()  -> User {
        if let  objUser = USERDEFAULTS.loadCustomObject(UDKeys.UserProfile) as? User{
            return objUser
        }
        return User(json: JSON())
    }
    
    func saveUser(objUser : User?){
        if let id = objUser?.sellerId, id != "" {
            objUser?.isSeller = true
        }
        USERDEFAULTS.saveCustomObject(objUser ?? self, key: UDKeys.UserProfile)
    }
    
    func deleteUser(){
        USERDEFAULTS.removeObject(forKey: UDKeys.UserProfile)
        UserDefaults.standard.synchronize();
    }
}
