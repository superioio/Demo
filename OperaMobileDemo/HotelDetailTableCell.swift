//
//  HotelDetailTableCell.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 10/10/2017.
//  Copyright © 2017 ZhangJun. All rights reserved.
//

import Foundation
import UIKit

class HotelDetailTableCell: UITableViewCell {
    
    let cellHeight:CGFloat = 250
    let width = UIScreen.main.bounds.size.width//获取屏幕宽
    var imgView : UIImageView?//cell上的图片
    var wifiView : UIImageView?
    var dinnerView : UIImageView?
    var titleLabel:UILabel?//cell上room name
    var line:UIView!
    var price:UILabel!
    var discount:UILabel?
    var discountLine:UIView?
    var bookbtn:UIButton!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "Cell")
        
        //picture
        imgView = UIImageView(frame: CGRect(x:10, y:10, width:355, height:cellHeight-100))
        self.contentView.addSubview(imgView!)
        
        //room name
        titleLabel = UILabel(frame: CGRect(x:20, y:cellHeight-80, width: 150, height:20))
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .left
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.contentView.addSubview(titleLabel!)
        
        //line
        line = UIView(frame: CGRect(x: 20, y: cellHeight-58, width: 200, height: 1))
        line.backgroundColor = UIColor.lightGray
         self.contentView.addSubview(line!)
        
        //price
        price = UILabel(frame: CGRect(x:30, y:cellHeight-38, width:50, height:20))
        price?.numberOfLines = 0
        price?.textAlignment = .left
        price?.font = UIFont.boldSystemFont(ofSize: 16)
        price?.textColor = UIColor.orange
        
        self.contentView.addSubview(price!)
        
            discount = UILabel(frame: CGRect(x:80, y:cellHeight-37, width:40, height:20))
            discount?.numberOfLines = 0
            discount?.textAlignment = .left
            discount?.font = UIFont.boldSystemFont(ofSize: 12)
            discount?.textColor = UIColor.lightGray
            self.contentView.addSubview(discount!)

        //icon
        wifiView = UIImageView(frame: CGRect(x:200, y:cellHeight-37, width:16, height:16))
        wifiView?.image =  UIImage(named: "icon_wifi")
        dinnerView = UIImageView(frame: CGRect(x:225, y:cellHeight-37, width:16, height:16))
        dinnerView?.image =  UIImage(named: "icon_dinner")
        self.contentView.addSubview(wifiView!)
        self.contentView.addSubview(dinnerView!)
        
        //book button
        bookbtn = UIButton(frame: CGRect(x: 280, y: cellHeight-45, width: 70, height: 30))
        bookbtn.layer.cornerRadius = 15
        bookbtn.layer.borderWidth = 1
        bookbtn.layer.borderColor = UIColor.cyan.cgColor
        bookbtn.setTitle("BOOK", for: .normal)
        bookbtn.setTitleColor(UIColor.cyan, for: .normal)
        self.contentView.addSubview(bookbtn!)

        self.contentView.layer.borderColor = UIColor(white: 0, alpha: 0.1).cgColor
        self.contentView.layer.borderWidth = 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
