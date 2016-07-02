//
//  Number.swift
//  Tweeter
//
//  Created by Jessica Choi on 7/1/16.
//  Copyright © 2016 Jessica Choi. All rights reserved.
//

import UIKit

class Number: NSObject {
    class func formatToString(number: Int) -> String {
        let million = 1000000
        let thousand = 1000
        let formatted: String
        if (number > million){
            formatted = String(number / million) + "M"
        } else if (number > (10 * thousand)) {
            formatted = String(number / thousand) + "K"
        } else {
            formatted = String(number)
        }
        return formatted
    }
    
    class func formatDateToStandardString(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "M/dd/yy, h:mm a"
        let dateString = dateFormatter.stringFromDate(date)
        return dateString
    }
}
