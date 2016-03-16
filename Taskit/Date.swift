//
//  Date.swift
//  Taskit
//
//  Created by Roy Montoya on 3/15/16.
//  Copyright © 2016 Roy Montoya. All rights reserved.
//

import Foundation

class Date {
    class func from (year:Int, month:Int, day:Int) -> NSDate {
        var components = NSDateComponents()
        
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorianCalendar?.dateFromComponents(components)
        
        return date!
    }
}