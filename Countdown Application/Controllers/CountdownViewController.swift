//
//  ViewController.swift
//  Countdown Application
//
//  Created by Burak Eryavuz on 7.09.2023.
//

import UIKit
import RealmSwift

class CountdownViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var countdownsTableView: UITableView!
    
    // Create realm
    let realm = try! Realm()
    
    //Array for load realm object
    var countdowns : Results<Countdown>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Find realm file
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
        
        countdownsTableView.backgroundColor = UIColor.white
        countdownsTableView.layer.cornerRadius = 20
        K.dropShadow(view: countdownsTableView, shadowColor: .darkGray)
        
        countdownsTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifierName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Load realm objects
        loadData()
        
        countdownsTableView.reloadData()
    }
    
    // Segmented control index Changed IBAction
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            loadData()
            countdownsTableView.reloadData()
            
            break;
        case 1:
            loadData()
            let filteredList = countdowns?.where{
                ($0.daysLeft == "1")
            }
            
            countdowns = filteredList
            countdownsTableView.reloadData()
            
            break;
        case 2:
            loadData()
            let filteredList = countdowns?.where{
                ($0.daysLeft == "1") || ($0.daysLeft == "2") || ($0.daysLeft == "3")
            }
            countdowns = filteredList
            countdownsTableView.reloadData()
            
            break;
        default:
            break;
        }
        
        
    }
    
    
    
    //MARK: - Load realm object method
    func loadData() {
        
        countdowns = realm.objects(Countdown.self).where{
            ($0.daysLeft != "Past")
        }
        
    }
    
    
    
    

}

extension CountdownViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countdowns?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifierName, for: indexPath) as! CountdownTableViewCell
        
        cell.backgroundColor = UIColor.clear
        cell.titleLabel.text = countdowns?[indexPath.row].title
        cell.iconLabel.text = countdowns?[indexPath.row].icon
        
        //Convert date to string
        let dateString = K.getDateString(date: countdowns![indexPath.row].date)
        cell.dateLabel.text = dateString
        
        
        let daysLeftString = K.getDaysLeft(selectedDate: countdowns![indexPath.row].date)
        cell.dateLeftCountLabel.text = daysLeftString
        try! realm.write {
            countdowns?[indexPath.row].daysLeft = daysLeftString
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! realm.write({
                realm.delete((countdowns?[indexPath.row])!)
            })
            self.loadData()
            self.countdownsTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        countdownsTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
