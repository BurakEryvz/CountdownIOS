//
//  ViewController.swift
//  Countdown Application
//
//  Created by Burak Eryavuz on 7.09.2023.
//

import UIKit

class CountdownViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var countdownsTableView: UITableView!
    @IBOutlet weak var filterAllButton: UIButton!
    @IBOutlet weak var filterLastDayButton: UIButton!
    @IBOutlet weak var filter3DaysLeftButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countdownsTableView.backgroundColor = UIColor.white
        countdownsTableView.layer.cornerRadius = 20
        K.dropShadow(view: countdownsTableView, shadowColor: .darkGray)
        
        countdownsTableView.register(UINib(nibName: "CountdownTableViewCell", bundle: nil), forCellReuseIdentifier: "CountdownCell")
    }
    
    //MARK: Filter buttons pressed IBAction
    @IBAction func filterButtonsPressed(_ sender: UIButton) {
    }
    
    
    
    

}

extension CountdownViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountdownCell", for: indexPath) as! CountdownTableViewCell
        
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
        
    }
    
    
    
    
    
}

