//
//  CheckViewConroller.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 2017/9/25.
//  Copyright © 2017年 ZhangJun. All rights reserved.
//

import UIKit
import Foundation
import ModernSearchBar

class CheckViewConroller: UIViewController, CalendarViewControllerDelegate,ModernSearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let options = NavigationDrawerOptions()
        options.navigationDrawerType = .LeftDrawer
        options.navigationDrawerOpenDirection = .AnyWhere
      //  options.navigationDrawerYPosition = 64
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DrawerViewController") as! DrawerViewController
        vc.user = user
        vc.email = email
        
        navigationDrawer = NavigationDrawer.sharedInstance
        navigationDrawer.setup(withOptions: options)
        navigationDrawer.setNavigationDrawerController(viewController: vc)

     //   naviItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(showDrawer))
        SetUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }
    
    func SetUI() {
        SetLayer()
        SetDateButton()
        SetSearchBar()
    }
    

    
    func SetSearchBar() {
        modernSearchBar.delegateModernSearchBar = self
        for t in modernSearchBar.subviews {
            if t.isKind(of: UITextField.self) {
                let tf = t as! UITextField
                tf.clearButtonMode = .never
            }
        }
        modernSearchBar.backgroundImage = UIImage()
       // (modernSearchBar as UITextField).clearButtonMode = .never
        var suggestionList = Array<String>()
        suggestionList.append("Oracle Building Z-Park 24")
        suggestionList.append("Oracle Building Z-Park 23")
        suggestionList.append("Zhongguancun Soft Park")
        self.modernSearchBar.setDatas(datas: suggestionList)
    }
    
    func onClickItemSuggestionsView(item: String) {
        print("User touched this item: "+item)
    }
    
    ///Called if you use Custom Item suggestion list
    func onClickItemWithUrlSuggestionsView(item: ModernSearchBarModel) {
        print("User touched this item: "+item.title+" with this url: "+item.url.description)
    }
    
    ///Called when user touched shadowView
    func onClickShadowView(shadowView: UIView) {
        print("User touched shadowView")
    }
//    func SetSearchBar() {
//        let demoCategories = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert", "UIView", "UITextfield", "UITableView", "Swift", "iOS", "Android"]
//        let demoSearchHistories = ["Menu", "Animation", "Transition", "TableView"]
//        
//        let ynSearch = YNSearch()
//       // ynSearch.setCategories(value: demoCategories)
//        ynSearch.setSearchHistories(value: demoSearchHistories)
//        
//        self.ynSearchinit()
//        
//        self.delegate = self
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        
//        let database1 = YNDropDownMenu(key: "YNDropDownMenu")
//        let database2 = YNSearchData(key: "YNSearchData")
//        let database3 = YNExpandableCell(key: "YNExpandableCell")
//        let demoDatabase = [database1, database2, database3]
//        
//        self.initData(database: demoDatabase)
//        self.setYNCategoryButtonType(type: .colorful)
//    }
//
//    func ynSearchListView(_ ynSearchListView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = self.ynSearchView.ynSearchListView.dequeueReusableCell(withIdentifier: YNSearchListViewCell.ID) as! YNSearchListViewCell
//        if let ynmodel = self.ynSearchView.ynSearchListView.searchResultDatabase[indexPath.row] as? YNSearchModel {
//            cell.searchLabel.text = ynmodel.key
//        }
//        
//        return cell
//    }
//    
//    func ynSearchListView(_ ynSearchListView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let ynmodel = self.ynSearchView.ynSearchListView.searchResultDatabase[indexPath.row] as? YNSearchModel, let key = ynmodel.key {
//            self.ynSearchView.ynSearchListView.ynSearchListViewDelegate?.ynSearchListViewClicked(key: key)
//            self.ynSearchView.ynSearchListView.ynSearchListViewDelegate?.ynSearchListViewClicked(object: self.ynSearchView.ynSearchListView.database[indexPath.row])
//            self.ynSearchView.ynSearchListView.ynSearch.appendSearchHistories(value: key)
//        }
//    }
//    
//    func pushViewController(text:String) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "detail") as! DetailViewController
//        vc.clickedText = text
//        
//        self.present(vc, animated: true, completion: nil)
//    }
//    
//    func ynSearchListViewDidScroll() {
//        self.ynSearchTextfieldView.ynSearchTextField.endEditing(true)
//    }
//    
//    func ynSearchHistoryButtonClicked(text: String) {
//        self.pushViewController(text: text)
//        print(text)
//    }
//    
//    func ynCategoryButtonClicked(text: String) {
//        self.pushViewController(text: text)
//        print(text)
//    }
//    
//    func ynSearchListViewClicked(key: String) {
//        self.pushViewController(text: key)
//        print(key)
//    }
//    
//    func ynSearchListViewClicked(object: Any) {
//        print(object)
//    }

    
    func SetLayer() {
//        viewHead.layer.shadowOffset = CGSize(width: 55, height: 20)
//        viewHead.layer.shadowColor = UIColor.darkGray.cgColor
//        viewHead.layer.shadowPath = UIBezierPath(rect: viewHead.bounds).cgPath
        btnCheckIn.layer.borderWidth = 1
        btnCheckIn.layer.borderColor = UIColor.lightGray.cgColor
        btnCheckIn.contentEdgeInsets = UIEdgeInsets(top: 15, left: -35, bottom: 0, right: 0)
        btnCheckOut.layer.borderWidth = 1
        btnCheckOut.layer.borderColor = UIColor.lightGray.cgColor
        btnCheckOut.contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 0)
        lblDays.textAlignment = .center
        lblDays.layer.cornerRadius = 10
        lblDays.layer.borderWidth = 2
        lblDays.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    //var cj:CJCalendarViewController!
    @IBOutlet var lblDays: UILabel!
    @IBOutlet var btnCheckIn: UIButton!
    @IBOutlet var btnCheckOut: UIButton!
    @IBOutlet var viewHead: UIView!
  //  @IBOutlet var viewHead: UINavigationBar!
    @IBOutlet var modernSearchBar: ModernSearchBar!
    @IBOutlet var btnSetting:UIButton!
        @IBOutlet var naviItem:UINavigationItem!
    var user:String?
    var email:String?
    //@IBOutlet var barSearch: YNSearch!
    var navigationDrawer: NavigationDrawer!
    
    var isCheckIn = true
    
    @IBAction func CheckInPressed(){
        isCheckIn = true;
        let cj = CalendarVC()
        cj.delegate = self
        self.present(cj, animated: true, completion: nil)
    }
    
    @IBAction func CheckOutPressed(){
        isCheckIn = false;
        let cj = CalendarVC()
        cj.view.frame = self.view.frame
        cj.delegate = self
        self.present(cj, animated: true, completion: nil)
    }
    
    func calendarViewController(_ controller: CJCalendarViewController!, didSelectActionYear year: String!, month: String!, day: String!) {
        let dateStr = year + "-" + month + "-" + day
        if isCheckIn {
            btnCheckIn.setAttributedTitle(MuteableAttrStr(str1: DateStrFormat.GetMonthDayStr(mon:month,day:day),str2: DateStrFormat.GetWeekdayStr(DateStr: dateStr)), for: .normal)
           // btnCheckIn.setTitle(year, for: .normal)
        }
        else{
            btnCheckOut.setTitle(year, for: .normal)
        }
        
    }
    
    @IBAction func SearchPressed(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "HotelList") as! HotelListVC
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func SettingPressed(){
        showDrawer()

    }
    
    @IBAction func MyLocationPressed(){
        modernSearchBar.text = "Oracle Building Z-Park 24"
    }
    
    func showDrawer() {

        NavigationDrawer.sharedInstance.toggleNavigationDrawer(completionHandler: nil)
    }
    
    func MuteableAttrStr(str1:String,str2:String)->NSMutableAttributedString{
        let str:NSMutableAttributedString = NSMutableAttributedString()

        let monthday = NSAttributedString(string: str1, attributes:[NSForegroundColorAttributeName:UIColor.darkText, NSFontAttributeName:UIFont.boldSystemFont(ofSize: 21)])
       
        let weekday = NSAttributedString(string: str2, attributes: [NSForegroundColorAttributeName:UIColor.darkText, NSFontAttributeName:UIFont.systemFont(ofSize: 5)])

        let space = "   "
        let spaceA = NSAttributedString(string: space, attributes: nil)
        str.append(monthday)
        str.append(spaceA)
        str.append(weekday)
        
        return str
    }
        
    func SetDateButton(){
        let dateNow = Date()
        let dateTomorrow = Date().addingTimeInterval(24*60*60)
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let dateStr = df.string(from: dateNow)
        let dateStrt = df.string(from: dateTomorrow)

        let dIndex = dateStr.index(dateStr.startIndex, offsetBy: 8)
        //let dtIndex = dateStrt.index(dateStr.startIndex, offsetBy: 8)
     //   let y = "\(String(describing: comps?.year))"
        let m = NSString(string:dateStr).substring(with: NSMakeRange(5, 2))
        let d = dateStr.substring(from: dIndex)
      //   let ty =  String( describing: compst?.year)
        let tm =   NSString(string:dateStrt).substring(with: NSMakeRange(5, 2))
         let td = dateStrt.substring(from: dIndex)
        
        print(dateStr)
        btnCheckIn.setAttributedTitle(MuteableAttrStr(str1: DateStrFormat.GetMonthDayStr(mon:m,day:d),str2: DateStrFormat.GetWeekdayStr(DateStr: dateStr)), for: .normal)
         btnCheckOut.setAttributedTitle(MuteableAttrStr(str1: DateStrFormat.GetMonthDayStr(mon:tm,day:td),str2: DateStrFormat.GetWeekdayStr(DateStr: dateStrt)), for: .normal)
    }
    
}

