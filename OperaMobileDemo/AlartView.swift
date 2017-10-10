//
//  AlartView.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 26/09/2017.
//  Copyright © 2017 ZhangJun. All rights reserved.
//

import Foundation
import UIKit

class UcAlert{
    
    
    func Error(info:String, level:Int, view: UIViewController){
        var title:String = "info"
        switch level {
        case 0:
            title = "Warning"
        case 1:
            title = "Error"
        default:
            title = "Info"
        }
        
        let alert = UIAlertController(title: title, message: info,preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {action in print("Click OK")})
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        view.present(alert, animated: true, completion: nil)
    }
}

