//
//  CalendarVC.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 2017/9/25.
//  Copyright © 2017年 ZhangJun. All rights reserved.
//

import UIKit

class CalendarVC: CJCalendarViewController,CalendarViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cj = CJCalendarViewController.init()
        cj.view.frame = self.view.frame
        //var date = Date()
        // cj.setYear("2017", month: "1", day: "5")
        //  cj.setBgAlpha(0.8, color: UIColor.black)
       // cj.delegate = self

    }

}
//extension CalendarVC:CalendarViewControllerDelegate{
//
//    func didse
//}
