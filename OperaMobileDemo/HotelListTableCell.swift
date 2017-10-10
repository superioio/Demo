//
//  tbvCell.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 09/10/2017.
//  Copyright © 2017 ZhangJun. All rights reserved.
//

import Foundation
import UIKit

class HotelListTableCell: UITableViewCell {
    
    let cellHeight:CGFloat = 80
    let width = UIScreen.main.bounds.size.width//获取屏幕宽
    var imgView : UIImageView?//cell上的图片
    var starView : UIImageView?//cell上的star
    var titleLabel:UILabel?//cell上hotel name
    var distance:UILabel?
    var price:UILabel?
    var lblfrom:UILabel!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "Cell")
        
        //picture
        imgView = UIImageView(frame: CGRect(x:0, y:3, width:120, height:cellHeight-3))
        self.contentView.addSubview(imgView!)
        
        //hotel name
        titleLabel = UILabel(frame: CGRect(x:(imgView?.bounds.maxX)! + 15, y:0, width:(width-150), height:35))
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .left
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.contentView.addSubview(titleLabel!)
        
        //distance
        distance = UILabel(frame: CGRect(x:(imgView?.bounds.maxX)! + 15, y:cellHeight-25, width:35, height:20))
        distance?.numberOfLines = 0
        distance?.textAlignment = .left
        distance?.font = UIFont.systemFont(ofSize: 10)
        distance?.textColor = UIColor.lightGray
        self.contentView.addSubview(distance!)
        
        //stars
        starView = UIImageView(frame: CGRect(x:(imgView?.bounds.maxX)! + (distance?.bounds.width)! + 35, y:cellHeight-25, width:20, height:20))
        self.contentView.addSubview(starView!)
        
        //price
        lblfrom = UILabel(frame: CGRect(x:width - 85, y:cellHeight-25, width:30, height:20))
        lblfrom.textAlignment = .left
        lblfrom.font = UIFont.boldSystemFont(ofSize: 10)
        lblfrom.textColor = UIColor.lightGray
        lblfrom.text = "from"
        self.contentView.addSubview(lblfrom)
        
        price = UILabel(frame: CGRect(x:width - 55, y:cellHeight-25, width:55, height:20))
        price?.numberOfLines = 0
        price?.textAlignment = .left
        price?.font = UIFont.boldSystemFont(ofSize: 16)
        price?.textColor = UIColor.orange
        self.contentView.addSubview(price!)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
