//
//  HotelDetailVC.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 10/10/2017.
//  Copyright © 2017 ZhangJun. All rights reserved.
//

import Foundation
import UIKit

class HotelDetailVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableview.layer.frame = CGRect(x: 0, y: 20, width: self.view.bounds.width, height: self.view.bounds.height - 20)
        tableview.tableHeaderView = headview
        tableview.dataSource = self
        tableview.delegate = self
    tableview.register(HotelDetailTableCell.classForCoder(), forCellReuseIdentifier: "Cell")
        InitRoomList()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var headview:UIView!
    @IBOutlet var tableview:UITableView!
    @IBOutlet var textView:UITextView!
    var roomList: Array<RoomInfo> = []
    
    @IBAction func backToPrevious() {
        dismiss(animated: true, completion: nil)
    }
    //fake data
    func InitRoomList() {
        let h1 = RoomInfo(roomName: "SUPERIOR DOUBLE", price: 300, discount: 399, imageStr: "room1")
        roomList.append(h1)
        let h2 = RoomInfo(roomName: "PREMIER", price: 350, discount: 0, imageStr: "room2")
        roomList.append(h2)
        let h3 = RoomInfo(roomName: "SINGLE ROOM", price: 280, discount: 0, imageStr: "room3")
        roomList.append(h3)
        let h4 = RoomInfo(roomName: "STANDARD ROOM", price: 550, discount: 0, imageStr: "room4")
        roomList.append(h4)
        let h5 = RoomInfo(roomName: "BUSINESS ROOM", price: 800, discount: 1099, imageStr: "room5")
        roomList.append(h5)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return roomList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! HotelDetailTableCell
        
        cell.titleLabel?.text = roomList[indexPath.row].roomName
        
        if(roomList[indexPath.row].discount > 0){
            cell.discount?.text =  "\(roomList[indexPath.row].discount)$"
            let discountLine = UIView(frame: CGRect(x:80, y:250-27, width:30, height:1))
            discountLine.backgroundColor = UIColor.darkGray
            cell.contentView.addSubview(discountLine)
        }

        
        cell.price?.text = "\(roomList[indexPath.row].price)$"
        
        let image = UIImage(named: roomList[indexPath.row].imageStr)
        cell.imgView?.image = image

        cell.bookbtn.addTarget(self, action: #selector(BookPressed), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
    }
    
    func BookPressed() {
        let alert = UIAlertController(title: "Do you want to book this room?", message: "The reservation can be canceled in any time.",preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Yes", style: .default, handler: {action in print("Click OK")})
        let cancelAction = UIAlertAction(title: "Not now", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
