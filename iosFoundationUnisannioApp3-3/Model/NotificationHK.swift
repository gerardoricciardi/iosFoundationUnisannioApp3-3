//
//  NotificationHK.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 06/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationHK{
    
    var title: String = ""
    var body: String = ""
    var id: String = ""
    var hour: Int?
    var minute: Int
    var timer: Double
    var check: Bool
    
    init(title: String, body: String, id: String, hour: Int, minute: Int) {
        self.title = title
        self.body = body
        self.id = id
        self.hour = hour
        self.minute = minute
        self.timer = 0.0
        self.check = true
    }
    init(title: String, body: String, id: String, timer: Double) {
        self.title = title
        self.body = body
        self.id = id
        self.hour = 0
        self.minute = 0
        self.timer = timer
        self.check = false
    }
    
    
}
