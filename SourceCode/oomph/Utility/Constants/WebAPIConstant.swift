//
//  WebAPIConstant.swift
//  VMS Employee
//
//  Created by Ronak on 30/05/18.
//  Copyright © 2018 Ecosmob. All rights reserved.
//

import Foundation
import UIKit

struct WebAPI{
    
    //BASE URL
    static let BaseURL              = "http://developer.appuno.co/krishi_sanchar/index.php?route="
    static let BaseURLSeller        = "http://developer.appuno.co/krishi_sanchar/seller/index.php?route="
    
    //*** Authentication ***
    //User
    static let register             = WebAPI.BaseURL + "rest_api/user/register"
    static let login                = WebAPI.BaseURL + "rest_api/user/login"
    static let forgot               = WebAPI.BaseURL + "rest_api/user/forgotten"
    static let profile              = WebAPI.BaseURL + "rest_api/user/profile"
    static let coupounOfferList     = WebAPI.BaseURL + "rest_api/order/coupon_list"
    static let marketPlaceList      = WebAPI.BaseURL + "rest_api/catalog/productlist"
    static let machineryBookingList = WebAPI.BaseURL + "rest_api/booking"
    static let shareThoughtsList    = WebAPI.BaseURL + "rest_api/thoughts/list"
    static let shareThoughtView     = WebAPI.BaseURL + "rest_api/thoughts/view"
    static let addThought           = WebAPI.BaseURL + "rest_api/thoughts/add"
    static let thoughtComment       = WebAPI.BaseURL + "rest_api/thoughts/getComment"
    static let addComment           = WebAPI.BaseURL + "rest_api/thoughts/addComment"
    static let promos               = WebAPI.BaseURL + "rest_api/advertisement/listAds"
    static let categoryList         = WebAPI.BaseURL + "rest_api/catalog/categorylist"
    static let savedArticleList     = WebAPI.BaseURL + "rest_api/wishlist/view"
    static let orderHistoryList     = WebAPI.BaseURL + "rest_api/user/order_list"
    static let bookingHistoryList   = WebAPI.BaseURL + "rest_api/booking/bookingHistory"
    static let bookingHistoryDetal  = WebAPI.BaseURL + "rest_api/booking/bookingHistoryView"
    static let orderHistoryDetail   = WebAPI.BaseURL + "rest_api/user/order_detail"
    
    //Seller
    static let sellRegister         = WebAPI.BaseURLSeller + "rest_api/seller/register"
    static let sellLogin            = WebAPI.BaseURLSeller + "rest_api/seller/login"
    static let sellForgot           = WebAPI.BaseURLSeller + "rest_api/seller/forgotpass"
   
}

//Web Api Request/Responce Keys
struct APIKeys {
    
    //Header Keys
    static let kLocalization                 = "X-localization"
    static let kPlatform                     = "X-platform"
    static let kOSVersion                    = "X-OSVersion"
    static let kDevice                       = "X-device"
    static let kAppVersion                   = "X-appVersion"
    static let kContentType                  = "Content-Type"
    static let kAuthorization                = "Authorization"
    static let kKey                          = "key"
    
    //Header Value
    static let kLocalizationValue           = Localize.currentLanguage()
    static let kPlatformValue               = UIDevice.current.systemName
    static let kOSVersionValue              = UIDevice.current.systemVersion
    static let kDeviceValue                 = UIDevice.current.model
    //static let kAppVersionValue             = WebAPI.appVersion
    static let kContentTypeValue            = "application/json"
    static let kAuthorizationValue          = "Basic YXBwdW5vOjEyMw=="
    static let kKeyValue                    = "KRISHISH@NCH@R"
    static let kTokenValue                  = "KWqRHIvYJmSHWlQrfBDxksHvnBU3sn5j"
    
    //BodyTag
    //User
    static let tagUserRegistration          = "user_registration"
    static let tagUserLogin                 = "user_login"
    static let tagForgotPassword            = "forgot_password"
    static let tagProfile                   = "user_profile"
    static let tagCoupounOfferList          = "coupon_list"
    static let tagMarketPlaceist            = "product_list"
    static let tagAllThoughts               = "all_thoughts"
    static let tagViewThought               = "view_thoughts"
    static let tagListComment               = "list_comment"
    static let tagAddComment                = "add_comment"
    static let tagAddThoughts               = "add_thoughts"
    static let tagPromos                    = "advertisement_user_list"
    static let tagMachinery                 = "list_booking"
    static let tagCategoryList              = "category_list"
    static let tagSavedArticle              = "wishlist_view"
    static let tagOrderHistoryList          = "order_list"
    static let tagBookingList               = "user_booking"
    static let tagOrderDetail               = "order_detail"
    
    
    //Seller
    static let tagSellerRegistration        = "seller_register"
    static let tagSellerLogin               = "seller_login"
    static let tagSellerForgotPassword      = "seller_forgotpass"
    
    //Request Keys
    static let key                          = "key"
    static let tag                          = "tag"
    static let user_id                      = "user_id"
    static let token                        = "token"
    static let categoryID                   = "category_id"
    static let customerID                   = "customer_id"
    static let thoughtsID                   = "thoughts_id"
    static let bookingID                    = "booking_id"
    static let bookingUserID                = "booking_user_id"
    static let orderID                      = "order_id"
    static let subject                      = "subject"
    static let kMessage                     = "message"
    static let image                        = "image"
    static let isOffer                      = "is_offer"
    static let filter                       = "filters"
    static let information                  = "information"
    static let username                     = "username"
    static let password                     = "password"
    static let sort                         = "sort"
    static let order                        = "order"
    static let filter_latlong               = "filter_latlong"
    static let filter_price                 = "filter_price"
    static let filter_distance              = "filter_distance"
    static let filter_ratting               = "filter_ratting"
    static let filter_pricetype             = ""
    static let filter_category              = "filter_category"
    static let ip                           = "ip"
    static let mobileNumber                 = "mobile_number"
    static let alternetmobileNumber         = "alternate_mobile_number"
    static let isfrom                       = "isfrom"
    static let empID                        = "emp-id"
    static let authToken                    = "auth-token"
    static let dateTime                     = "dateTime"
    static let email                        = "email"
    static let visitorName                  = "visitor-name"
    static let branchId                     = "branch-id"
    static let meetingType                  = "meeting-type"
    static let meetingDetails               = "meeting_details"
    static let date                         = "date"
    static let fromDate                     = "from-date"
    static let toDate                       = "to-date"
    static let from                         = "from"
    static let to                           = "to"
    static let meetingLocation              = "meeting_location"
    static let fullName                     = "full_name"
    static let company                      = "company"
    static let location                     = "location"
    static let limit                        = "limit"
    static let page                         = "page"
    static let type                         = "type"
    static let meetingId                    = "meeting-id"
    static let meetingID                    = "meetingId"
    static let comment                      = "comment"
    static let meetingAgenda                = "meeting_agenda"
    static let forwardEmpId                 = "forwardempId"
    static let deviceToken                  = "device_token"
    static let firstName                    = "firstname"
    static let lastName                     = "lastname"
    static let telephone                    = "telephone"
    static let deviceId                     = "device_id"
    static let shopName                     = "shop_name"
    
    //Response Keys
    static let data                        = "data"
    static let message                     = "msg"
    static let status                      = "status"
    static let flag                        = "flag"
    static let hcode                       = "hcode"
    static let empId                       = "emp_id"
    static let otp                         = "otp"
    static let generateOtp                 = "generate_otp"
    static let isActive                    = "is_active"
    static let description                 = "description"
}

struct APIResponseCode{
    enum code : Int {
        
        //Success
        case Code100    = 100
        case Code101    = 101
        case Code200100 = 200100
        case Code200101 = 200101
        case Code200102 = 200102
        //Error
        case Code426    = 426
        //Constat Default
        case Code0      = 0
        
        init(fromRawValue: Int){
            self = code(rawValue: fromRawValue) ?? .Code0
        }
        
        //Get data from ID
        static var successValues: [code] {
            return [
                .Code100,
                .Code101,
                .Code200100,
                .Code200101,
                .Code200102
            ]
        }
    }
}

enum MeetingStatusFlag : String {
    case ACCEPT     = "Accept"
    case REJECT     = "Rejected"
    case CANCEL     = "Cancelled"
    case COMPLETED  = "Completed"
}
