//
//  Countdown.swift
//  Countdown Application
//
//  Created by Burak Eryavuz on 10.09.2023.
//

import Foundation
import RealmSwift

//MARK: - Define Countdown object model
class Countdown: Object {
    @Persisted var title: String
    @Persisted var icon: String
    @Persisted var date: Date
    @Persisted var daysLeft: String
    
    convenience init(title: String, icon: String, date: Date, daysLeft: String) {
        self.init()
        self.title = title
        self.icon = icon
        self.date = date
        self.daysLeft = daysLeft
    }
    
}
