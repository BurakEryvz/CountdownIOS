//
//  Constants.swift
//  Countdown Application
//
//  Created by Burak Eryavuz on 9.09.2023.
//

import Foundation
import UIKit

struct K {
    
    
    
    
    static func dropShadow(view: UIView, shadowColor: UIColor = .lightGray) {
        
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = view.layer.cornerRadius
        view.layer.shadowOpacity = 0.2
        
        
    }
}
