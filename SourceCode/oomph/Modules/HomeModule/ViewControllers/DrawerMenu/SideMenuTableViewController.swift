//
//  SideMenuTableViewController.swift
//  SideMenu
//
//  Created by Jon Kent on 4/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import SideMenu

class SideMenuTblCell: UITableViewCell {
    
    @IBOutlet weak var imgLeft: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    
}

enum MenuItem : String{
    case HOME       = "Home"
    case PROFILE    = "Profile"
    case SETTING        = "Setting"
    case SIGNOUT    = "Sign Out"
    
    //User
    case INFORMATION    = "Information"
    case MYBOOKINGS     = "My Bookings"
    case SAVEDARTICLES  = "Saved Articles"
    case FAVOURARTICLES = "Favourite Articles"
    case ORDERHISTORY   = "Order History"
    case DOWNLODED      = "Downloaded"
    case COUPNOFFER     = "Coupon & offer"
    case ASKCHAT        = "Ask Us/Chat"
    
    //Seller
    case MACHINERY      = "Machinery"
    case MACHINERYORDER = "Machinery Order"
    case BOOKINGREVIEW  = "Booking Reviews"
    case MYPRODUCTS     = "My Prodcuts"
    case MYPROMOS       = "My Promos"
    case TRANSACTION    = "Transaction"
    case ORDERS         = "Orders"
    case CHAT           = "Chat"
    
    static var values : [MenuItem] {
        return [
            .HOME,
            .PROFILE,
            .SAVEDARTICLES,
            .COUPNOFFER,
            .SIGNOUT
        ]
    }
}
class SideMenuTableViewController: UIViewController {
    
    var aryMenu = [[String : Any]]()
    
    var currUser : User!
    
    @IBOutlet weak var tblMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currUser = User.loadLoggedInUser()
        
        //Fill Menu array
        
        aryMenu = [
            ["img" : #imageLiteral(resourceName: "menu_home"),  "title" : MenuItem.HOME],
            ["img" : #imageLiteral(resourceName: "menu_profile"),  "title" : MenuItem.PROFILE],
            ["img" : #imageLiteral(resourceName: "menu_info"),  "title" : MenuItem.INFORMATION],
            ["img" : #imageLiteral(resourceName: "menu_profile"),  "title" : MenuItem.MYBOOKINGS],
            ["img" : #imageLiteral(resourceName: "menu_machine_order"),  "title" : MenuItem.SAVEDARTICLES],
            ["img" : #imageLiteral(resourceName: "menu_star"),  "title" : MenuItem.FAVOURARTICLES],
            ["img" : #imageLiteral(resourceName: "menu_order_history"),  "title" : MenuItem.ORDERHISTORY],
            ["img" : #imageLiteral(resourceName: "menu_profile"),  "title" : MenuItem.DOWNLODED],
            ["img" : #imageLiteral(resourceName: "menu_profile"),  "title" : MenuItem.COUPNOFFER],
            ["img" : #imageLiteral(resourceName: "menu_chat"),  "title" : MenuItem.ASKCHAT],
            ["img" : #imageLiteral(resourceName: "menu_profile"),  "title" : MenuItem.SETTING],
            ["img" : #imageLiteral(resourceName: "menu_logout"),  "title" : MenuItem.SIGNOUT]
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // refresh cell blur effect in case it changed
        //self.tblMenu.reloadData()
        
    }
    
    
    
}

//MARK: - Tableview Delegate Methods
extension SideMenuTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aryMenu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = super.tableView(tableView, cellForRowAt: indexPath) as! UITableViewVibrantCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTblCell") as! SideMenuTblCell
        let objDict = aryMenu[indexPath.row]
        if let img = objDict["img"] as? UIImage{
            cell.imgLeft.image = img
        }
        if let item = objDict["title"] as? MenuItem{
            cell.lblTitle.text = item.rawValue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objDict = aryMenu[indexPath.row]["title"] as? MenuItem{
            switch objDict {
            case .HOME:
                if currUser.isSeller!{
                    self.redirectToViewController(storyboardId: StoryboardId.SELLER, vcID: VCId.NAV_HOMEVC)
                }else{
                    self.redirectToViewController(storyboardId: StoryboardId.USER, vcID: VCId.NAV_HOMEVC)
                }
            case .PROFILE:
                self.redirectToViewController(storyboardId: StoryboardId.HOME, vcID: VCId.PROFILEVC)
            case .SAVEDARTICLES:
                self.redirectToViewController(storyboardId: StoryboardId.ARTICLES, vcID: VCId.SAVEDARTICLE)
            case .MYBOOKINGS:
                self.redirectToViewController(storyboardId: StoryboardId.BOOKING, vcID: VCId.BOOKINGVC)
            case .COUPNOFFER:
                self.redirectToViewController(storyboardId: StoryboardId.HOME, vcID: VCId.COUPONANDOFFERVC)
            case .INFORMATION:
                self.redirectToViewController(storyboardId: StoryboardId.INFORMATION, vcID: VCId.INFORMATIONVC)
            case .ORDERHISTORY:
                self.redirectToViewController(storyboardId: StoryboardId.ORDER, vcID: VCId.ORDERHISTORYVC)
            case .SIGNOUT:
                dismiss(animated: true, completion: {
                    CommonFunction.Instance.performLogout()
                })
            default:
                break
            }
        }
    }
    
    func redirectToViewController(storyboardId : String, vcID: String){
        //let destVC = UIStoryboard(name: StoryboardId, bundle: nil).
        let destVC = UIStoryboard.init(name: storyboardId, bundle: nil).instantiateViewController(withIdentifier: vcID)
        self.navigationController?.pushViewController(destVC, animated: true)
    }
}
