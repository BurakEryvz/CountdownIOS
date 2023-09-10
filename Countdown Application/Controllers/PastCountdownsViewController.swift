//
//  PastCountdownsViewController.swift
//  Countdown Application
//
//  Created by Burak Eryavuz on 10.09.2023.
//

import UIKit
import RealmSwift

class PastCountdownsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var pastCountdownsTableView: UITableView!
    
    let realm = try! Realm()
    
    var pastCountdowns: Results<Countdown>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pastCountdownsTableView.layer.cornerRadius = 20
        K.dropShadow(view: pastCountdownsTableView, shadowColor: .darkGray)
        
        pastCountdownsTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifierName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadPastCountdowns()
    }
    
    func loadPastCountdowns() {
        pastCountdowns = realm.objects(Countdown.self).where{
            ($0.daysLeft == "Past")
        }
    }
    
    
    //MARK: - UITableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pastCountdowns?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pastCountdownsTableView.dequeueReusableCell(withIdentifier: K.cellIdentifierName, for: indexPath) as! CountdownTableViewCell
        
        cell.titleLabel.text = pastCountdowns![indexPath.row].title
        cell.dateLabel.text = K.getDateString(date: pastCountdowns![indexPath.row].date)
        cell.iconLabel.text = pastCountdowns![indexPath.row].icon
        cell.dateLeftCountLabel.text = pastCountdowns![indexPath.row].daysLeft
        cell.stringLabel.isHidden = true
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
                realm.delete((pastCountdowns?[indexPath.row])!)
            })
            self.loadPastCountdowns()
            self.pastCountdownsTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pastCountdownsTableView.deselectRow(at: indexPath, animated: true)
    }
    

    

}
