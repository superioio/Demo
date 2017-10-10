//
//  DrawerBackView.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 28/09/2017.
//  Copyright © 2017 ZhangJun. All rights reserved.
//

import Foundation
import UIKit

class DrawerBackViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    var text:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLabel.text = text
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showDrawer))
        
        NavigationDrawer.sharedInstance.initialize(forViewController: self, isFirstSkip: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showDrawer()
    {
        NavigationDrawer.sharedInstance.toggleNavigationDrawer(completionHandler: nil)
    }
    
    
}
