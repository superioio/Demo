//
//  DateStrFormat.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 26/09/2017.
//  Copyright © 2017 ZhangJun. All rights reserved.
//

import Foundation

class DateStrFormat {
    
    static func GetMonthStr(mon: String) -> String {
        do{
            let str = NSString(string: mon)
            let monInt = str.intValue
            switch monInt {
            case 1:
                return "Jan"
            case 2:
                return "Feb"
            case 3:
                return "Mar"
            case 4:
                return "Apr"
            case 5:
                return "May"
            case 6:
                return "Jun"
            case 7:
                return "Jul"
            case 8:
                return "Aug"
            case 9:
                return "Sep"
            case 10:
                return "Oct"
            case 11:
                return "Nov"
            case 12:
                return "Dec"
            default:
                return ""
            }
        }
        catch{
            return ""
        }
    }
    
    static func GetIntervalDays(BeginDate:String, EndDate:String) -> Int {
        let dm = DateFormatter()
        dm.dateFormat = "yyyy-MM-dd"
        
        let begin = dm.date(from: BeginDate)
        let end = dm.date(from: EndDate)
        
        
        return Int(end!.timeIntervalSince(begin!))
    }
    
    static func GetMonthDayStr(mon:String,day:String) -> String {
        let monstr = GetMonthStr(mon: mon)
        let str = monstr + "." + day
        return str
    }
    
    static func GetWeekdayStr(DateStr:String) -> String{
        let weekdays=["Sunday","Monday","Tuseday","Wednessday","Thursday","Friday","Saturday"]
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let datestr = df.date(from: DateStr)

        let calendar = NSCalendar.init(calendarIdentifier: .gregorian)
        calendar?.timeZone = NSTimeZone.system
        let calendarUnit = NSCalendar.Unit.weekday
        let theComponents = calendar?.components(calendarUnit, from: datestr!)
        let weekday = weekdays[(theComponents?.weekday)!-1]
        return weekday
    }
    
}
