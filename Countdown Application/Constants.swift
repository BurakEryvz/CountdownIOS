//
//  Constants.swift
//  Countdown Application
//
//  Created by Burak Eryavuz on 9.09.2023.
//

import Foundation
import UIKit

struct K {
    
    
    static let cellNibName = "CountdownTableViewCell"
    static let cellIdentifierName = "CountdownCell"
    
    
    
    static func dropShadow(view: UIView, shadowColor: UIColor = .lightGray) {
        
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = view.layer.cornerRadius
        view.layer.shadowOpacity = 0.2
        
        
    }
    
    static func createAlert(title: String, message: String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .cancel)
        
        alert.addAction(action)
        
        return alert
    }
    
    //MARK: - date convert to string method
    static func getDateString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    //MARK: -getDaysLeft method
    static func getDaysLeft(selectedDate: Date) -> String {
        let diff = Calendar.current.dateComponents([.day], from: Date(), to: selectedDate)
        if diff.day! >= 0 {
            let daysLeft: String = String(diff.day!+1 ?? 1)
            return daysLeft
        } else {
            let daysLeft: String = "Past"
            return daysLeft
        }
        
    }
}
