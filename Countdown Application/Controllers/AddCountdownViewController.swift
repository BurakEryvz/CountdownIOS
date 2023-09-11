//
//  AddCountdownViewController.swift
//  Countdown Application
//
//  Created by Burak Eryavuz on 9.09.2023.
//

import UIKit
import MCEmojiPicker
import RealmSwift

class AddCountdownViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleBubbleView: UIView!
    @IBOutlet weak var iconBubbleView: UIView!
    @IBOutlet weak var dateBubbleView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // Create realm
    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        
        datePicker.minimumDate = .now
        
        mainView.layer.cornerRadius = 20
        K.dropShadow(view: mainView, shadowColor: .lightGray)
        
        titleBubbleView.layer.cornerRadius = 10
        K.dropShadow(view: titleBubbleView)
        
        iconBubbleView.layer.cornerRadius = 10
        K.dropShadow(view: iconBubbleView)
        
        dateBubbleView.layer.cornerRadius = 10
        K.dropShadow(view: dateBubbleView)
        
    }
    

    @IBAction func selectIconButtonPressed(_ sender: UIButton) {
        let emojiVC = MCEmojiPickerViewController()
        emojiVC.delegate = self
        emojiVC.sourceView = sender
        present(emojiVC, animated: true)
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if titleTextField.text != "", iconLabel.text != "" {
            
            let newCountdown = Countdown(title: titleTextField.text!, icon: iconLabel.text!, date: datePicker.date, daysLeft: K.getDaysLeft(selectedDate: datePicker.date))
            saveData(data: newCountdown)
            self.navigationController?.popViewController(animated: true)
            
        } else {
            let alert = K.createAlert(title: "Please fill all fields", message: "")
            present(alert, animated: true)
        }
    }
    
   
    
    
    //MARK: - Save Realm Data method
    func saveData(data: Object) {
        do {
            try realm.write({
                realm.add(data)
            })
        } catch {
            print("Error : Data isn't saving")
        }
    }
    
   
    
}

extension AddCountdownViewController: MCEmojiPickerDelegate {
    func didGetEmoji(emoji: String) {
        iconLabel.text = emoji
    }
    
    
}

extension UIViewController {
func dismissKeyboard() {
       let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
       tap.cancelsTouchesInView = false
       view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
       view.endEditing(true)
    }
}
