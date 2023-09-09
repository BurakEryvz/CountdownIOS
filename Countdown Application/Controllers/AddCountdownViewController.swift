//
//  AddCountdownViewController.swift
//  Countdown Application
//
//  Created by Burak Eryavuz on 9.09.2023.
//

import UIKit

class AddCountdownViewController: UIViewController {

    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleBubbleView: UIView!
    @IBOutlet weak var iconBubbleView: UIView!
    @IBOutlet weak var dateBubbleView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 20
        K.dropShadow(view: mainView, shadowColor: .lightGray)
        
        titleBubbleView.layer.cornerRadius = 10
        K.dropShadow(view: titleBubbleView)
        
        iconBubbleView.layer.cornerRadius = 10
        K.dropShadow(view: iconBubbleView)
        
        dateBubbleView.layer.cornerRadius = 10
        K.dropShadow(view: dateBubbleView)
        
    }
    

    

}
