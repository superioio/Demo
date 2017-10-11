//
//  NavigationDrawer.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 28/09/2017.
//  Copyright © 2017 ZhangJun. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var photoImage: UIImageView!
    @IBOutlet var dView: UIView!
    @IBOutlet var headView: UIImageView!
    @IBOutlet var lblUser:UILabel!
    @IBOutlet var lblEmail:UILabel!
    var btnSignOut: UIButton!
    
    let menuItem = [["Hotel","building"],
                   ["Wallet","wallet"],
                   ["Reservation","reservation"],
                   ["Favorite","favorites"],
                   ["History","history"],
                   ["Settings","settings"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetSignOutBtn()
        tableView.dataSource = self
        tableView.delegate = self
        
        SetUserInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SetUserInfo() {

        lblUser.text = user
        lblEmail.text = email
        photoShow()
    }
    
    var user:String?
    var email:String?
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        let touchClass = NSStringFromClass((touch.view?.classForCoder)!)
//        let supClass = NSStringFromClass((touch.view?.superview?.superview?.classForCoder)!)
//        if touchClass.components(separatedBy: "UITableView").count > 1
//            || touchClass == "UICollectionView"
//            || supClass == "UICollectionView"
//            || supClass == "UITableView" {
//            return false
//        }
//        return true
//    }
    func SetSignOutBtn(){
        let footView = UIView(frame: CGRect(x: 0, y: dView.bounds.height - 30, width: tableView.bounds.width, height: 30))
        btnSignOut = UIButton(frame: footView.bounds)
        // let singOutImage = UIImage(named: "sign_out")
        btnSignOut.setImage(#imageLiteral(resourceName: "sign_out"), for: .normal)
        btnSignOut.setTitle("Sign Out", for: .normal)
        btnSignOut.setTitleColor(UIColor.black, for: .normal)
        btnSignOut.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btnSignOut.titleLabel?.frame.origin.x = 50
        btnSignOut.contentMode = .left
        btnSignOut.imageView?.contentMode = .left
        //   let lblWidth:CGFloat = CGFloat((btnSignOut.titleLabel?.intrinsicContentSize.width)!)
        //   let blbHeight:CGFloat = CGFloat((btnSignOut.titleLabel?.intrinsicContentSize.height)!)
        btnSignOut.imageEdgeInsets = UIEdgeInsetsMake(0, -(tableView.bounds.width / 2), 0, 0)
        btnSignOut.titleEdgeInsets = UIEdgeInsetsMake(0, -(tableView.bounds.width / 2)+50, 0, 0)
        footView.addSubview(btnSignOut)
        footView.backgroundColor = UIColor.clear

        btnSignOut.addTarget(self, action: #selector(SignOutPressed), for: .touchUpInside)
        
        dView.addSubview(footView)
    }
    
    func SignOutPressed() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let cv = sb.instantiateViewController(withIdentifier: "LogInView")
        //  cv.delegate = self
        NavigationDrawer.sharedInstance.removeParent()
        self.present(cv, animated: true, completion: nil)
    }
    
    func handleTapGesture(){
        NavigationDrawer.sharedInstance.toggleNavigationDrawer { () -> Void in}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        
        cell?.textLabel?.text = menuItem[indexPath.row][0]
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 15)
        let image = UIImage(named: menuItem[indexPath.row][1])
        //image?.resizableImage(withCapInsets: UIEdgeInsetsMake()
       // let imageSize:CGSize = CGSize(width: 16, height: 10)
            
         //   UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
      //  let imageRect = CGRect(x: 0, y: 0, width: 10, height: 10)
        cell?.imageView?.image = image
       // cell?.imageView?.image?.draw(in: imageRect)
       // cell?.imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
    //    UIGraphicsEndImageContext()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 0 {
            NavigationDrawer.sharedInstance.toggleNavigationDrawer { () -> Void in
                
                //            if indexPath.row != 0
                //            {
                //
                //                let vc = self.storyboard?.instantiateViewController(withIdentifier: "DrawerBackViewController") as! DrawerBackViewController
                //                vc.text = self.menuItem[indexPath.row][0]
                //                self.navigationController?.viewControllers = [vc]
                //
                //            }
                //            else
                //            {
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "CheckView")
                                self.navigationController?.viewControllers = [vc!]
                //                
                //            }
            }
        }
        
    }
    

    
    func photoShow() {
        if user != "User"{
            let image = UIImage(named: "shulan")
            photoImage.image = image
        }
        photoImage.layer.cornerRadius = photoImage.bounds.height/2
        photoImage.layer.masksToBounds = true
      //  photoImage.layer.borderWidth = 1
      
        
    }
    
}
