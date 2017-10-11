//
//  HotelListVC.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 08/10/2017.
//  Copyright © 2017 ZhangJun. All rights reserved.
//

import Foundation
import UIKit

//class HotelListVC: UIViewController, DropDownMenuDelegate {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    //    let leftBtn = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backToPrevious))
//      //  leftBtn.setBackgroundImage(UIImage.init(named: "back"), for: .normal, barMetrics: .default)
//       // self.naviItem.leftBarButtonItem = leftBtn
//       // naviItem.leftBarButtonItem = leftBtn
//        SetDropMenus(nums: 4)
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//   // @IBOutlet var navigationbar: UINavigationBar!
//   // @IBOutlet var btnBack:UIButton!
//    @IBOutlet var naviItem:UINavigationItem!
//    @IBOutlet var dpBrand:DropDownMenu!
//    @IBOutlet var dpDistance:DropDownMenu!
//    @IBOutlet var dpStars:DropDownMenu!
//    @IBOutlet var dpOrder:DropDownMenu!
//    
//    @IBAction func backToPrevious() {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    func SetDropMenus(nums:Int){
//        
//        for i in 0 ..< nums {
//         //   var db = DropDownMenu()
////            db.frame = CGRect(x: CGFloat(i)*(self.view.bounds.width), y: 72, width: self.view.bounds.width/4, height: 42)
////     
//            switch i {
//            case 0:
//                dpBrand.editable = false
//                dpBrand.delegate = self
//                dpBrand.options = ["Unlimited","Sheraton","Hilton","Westin","Hyatt"]
//                  self.view.addSubview(dpBrand)
//            case 1:
//                dpDistance.editable = false
//                dpDistance.delegate = self
//                dpDistance.options = ["Unlimited","in 0.5km","0.5 to 2km","2 to 5km","above 5km"]
//                 dpDistance.defaultValue = "Distance"
//                  self.view.addSubview(dpDistance)
//            case 2:
//                dpStars.editable = false
//                dpStars.delegate = self
//                dpStars.options = ["Unlimited","3 stars","4 stars","5 stars"]
//                 dpStars.defaultValue = "Stars"
//                  self.view.addSubview(dpStars)
//            case 3:
//                dpOrder.editable = false
//                dpOrder.delegate = self
//                dpOrder.options = ["Unlimited","Distance","Popularity","Price"]
//                 dpOrder.defaultValue = "Order By"
//                  self.view.addSubview(dpOrder)
//            default:
//                return
//            }
//          
//        }
//    }
//    
//    func dropDownMenu(_ menu: DropDownMenu!, didChoose index: Int) {
//        print(index)
//
//
//    }
//    
//    func dropDownMenu(_ menu: DropDownMenu!, didInput text: String!) {
//        print(text)
//    }
//}
class HotelListVC: UIViewController,DOPDropDownMenuDataSource, DOPDropDownMenuDelegate,UITableViewDataSource,UITableViewDelegate {
    var brands: [String] = ["brands","Unlimited","Sheraton","Hilton","Westin","Hyatt"]
    var distance: [String] =  ["Distance","Unlimited","in 0.5km","0.5 to 2km","2 to 5km","above 5km"]
    var stars: [String] = ["Stars","Unlimited","3 stars","4 stars","5 stars"]
    var oderby: [String] = ["Order By","Distance","Popularity","Price"]
    
    var dopMenu : DOPDropDownMenu = DOPDropDownMenu()
    
    var hotelList: Array<HotelInfo> = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.title = "Oracle Building Z-Park 24"
      //  naviItem.title = "Oracle Building Z-Park 24"

        btnBack.setTitle("Oracle Building Z-Park 24", for: .normal)
        btnBack.setTitleColor(UIColor.white, for: .normal)
        dopMenu = DOPDropDownMenu(origin: CGPoint(x: 0, y: 72), height: 44)
        dopMenu.dataSource = self
        dopMenu.delegate = self
        self.view.addSubview(dopMenu)
        
        //dopMenu.selectDefalutIndexPath()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HotelListTableCell.classForCoder(), forCellReuseIdentifier: "Cell")
        InitHotelList()
    }
    @IBOutlet var naviItem:UINavigationItem!
    @IBOutlet var btnBack:UIButton!
    
    @IBAction func backToPrevious() {
            dismiss(animated: true, completion: nil)
        }
    
    func InitHotelList() {
        let h1 = HotelInfo(hotelName: "Hilto(Dongzhimen)", distance: "500m", stars: 5, price: 350, imageStr: "hotel1")
        hotelList.append(h1)
        let h2 = HotelInfo(hotelName: "Sheraton", distance: "100m", stars: 5, price: 220, imageStr: "hotel2")
        hotelList.append(h2)
        let h3 = HotelInfo(hotelName: "Westin", distance: "1.1km", stars: 3, price: 500, imageStr: "hotel3")
        hotelList.append(h3)
        let h4 = HotelInfo(hotelName: "Hyatt", distance: "3.5km", stars: 4, price: 600, imageStr: "hotel4")
        hotelList.append(h4)
        let h5 = HotelInfo(hotelName: "Accorhotel", distance: "9km", stars: 5, price: 260, imageStr: "hotel5")
        hotelList.append(h5)
        let h6 = HotelInfo(hotelName: "Drury", distance: "11km", stars: 3, price: 300, imageStr: "hotel6")
        hotelList.append(h6)
        let h7 = HotelInfo(hotelName: "Choice Hotel", distance: "21km", stars: 5, price: 888, imageStr: "hotel7")
        hotelList.append(h7)
        let h8 = HotelInfo(hotelName: "Majestic", distance: "26km", stars: 4, price: 666, imageStr: "hotel8")
        hotelList.append(h8)
        let h9 = HotelInfo(hotelName: "Magic Hotel", distance: "55km", stars: 3, price: 500, imageStr: "hotel9")
        hotelList.append(h9)
        let h10 = HotelInfo(hotelName: "Beijing Hotel", distance: "78km", stars: 5, price: 1000, imageStr: "hotel10")
        hotelList.append(h10)
    }
    //MARK:- 代理
    func numberOfColumnsInMenu(dopMenu menu: DOPDropDownMenu) -> Int {
        return 4
    }
    
    func menu(dopMenu menu: DOPDropDownMenu, numberOfRowsInColumn column: Int) -> Int {
        if column == 3 {
            return oderby.count - 1
        } else if column == 0 {
            return brands.count - 1
        } else if column == 1{
            return distance.count - 1
        } else if column == 2{
            return stars.count - 1
        }
        else{
            return 0
        }
    }
    
    func menu(dopMenu menu: DOPDropDownMenu, titleForRowAtIndexPath indexPath: DOPIndexPath) -> String {
        if indexPath.column == 3 {
            return oderby[indexPath.row! + 1]
        } else if indexPath.column == 0 {
            return brands[indexPath.row! + 1]
        } else if indexPath.column == 1{
            return distance[indexPath.row! + 1]
        } else if indexPath.column == 2{
            return stars[indexPath.row! + 1]
        }
        else{
            return ""
        }
    }
    
    //new datasource
    func menu(dopMenu menu: DOPDropDownMenu, imageNameForRowAtIndexPath indexPath: DOPIndexPath) -> String {
        //        if indexPath.column == 1 {
        //            if let num = indexPath.row {
        //                return "ic_filter_category_\(num)"
        //            }
        //
        //        } else if indexPath.column == 0 {
        //            return imgArr[indexPath.row!]
        //        }
        return ""
    }
    
    func menu(dopMenu menu: DOPDropDownMenu, imageNameForItemsInRowAtIndexPath indexPath: DOPIndexPath) -> String {
        //        if indexPath.column == 0 {
        //            if let num = indexPath.row {
        //                return "ic_filter_category_\(num)"
        //            }
        //        }
        return ""
    }
    
    func menu(dopMenu menu: DOPDropDownMenu, detailTextForRowAtIndexPath indexPath: DOPIndexPath) -> String {
        return String()
    }
    
    func menu(dopMenu menu: DOPDropDownMenu, detailTextForItemsInRowAtIndexPath indexPath: DOPIndexPath) -> String {
        return String()
    }
    
    func menu(dopMenu menu: DOPDropDownMenu, numberOfItemsInRow row: Int, column: Int) -> Int {
        //        if column == 1 {
        //            if row == 0 {
        //                return cates.count
        //            } else if row == 1 {
        //                return movices.count
        //            } else if row == 2 {
        //                return hotels.count
        //            }
        //        }
        return 0
    }
    
    func menu(dopMenu menu: DOPDropDownMenu, titleForItemsInRowAtIndexPath indexPath: DOPIndexPath) -> String {
        //        if indexPath.column == 1 {
        //            if indexPath.row == 0 {
        //                return cates[indexPath.item!]
        //            } else if indexPath.row == 1 {
        //                return movices[indexPath.item!]
        //            } else if indexPath.row == 2 {
        //                return hotels[indexPath.item!]
        //            }
        //        }
        return "没有"
    }
    
    func menu(_ menu: DOPDropDownMenu, didSelectRowAtIndexPath indexPath: DOPIndexPath) {
        if indexPath.item! > 0 {
            print("点击了第\(indexPath.column)列 - 第\(indexPath.row)行 - 第\(indexPath.item)项")
        } else {
            print("点击了第\(indexPath.column)列 - 第\(indexPath.row)行")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return hotelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! HotelListTableCell
        
        cell.titleLabel?.text = hotelList[indexPath.row].hotelName
        
        cell.distance?.text = hotelList[indexPath.row].distance == "100m" ? "<"+hotelList[indexPath.row].distance:hotelList[indexPath.row].distance
        
        cell.price?.text = "\(hotelList[indexPath.row].price)$"
        
        let image = UIImage(named: hotelList[indexPath.row].imageStr)
        cell.imgView?.image = image
        
        var starImgStr:String = "star"
        starImgStr += String( hotelList[indexPath.row].stars)
        let starImage = UIImage(named: starImgStr)
        cell.starView?.image = starImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        switch indexPath.row {
        case 0:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HotelDetail")
            self.present(vc!, animated: true, completion: nil)
        default:
            return
        }


        
    }

    
}

