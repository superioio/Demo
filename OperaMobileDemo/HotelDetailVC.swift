//
//  HotelDetailVC.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 10/10/2017.
//  Copyright © 2017 ZhangJun. All rights reserved.
//

import Foundation
import UIKit

class HotelDetailVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var textView:UITextView!
    
    @IBAction func backToPrevious() {
        dismiss(animated: true, completion: nil)
    }
}
