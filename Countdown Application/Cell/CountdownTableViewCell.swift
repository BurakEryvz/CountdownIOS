//
//  CountdownTableViewCell.swift
//  Countdown Application
//
//  Created by Burak Eryavuz on 8.09.2023.
//

import UIKit

class CountdownTableViewCell: UITableViewCell {

    
    @IBOutlet weak var stringLabel: UILabel!
    @IBOutlet weak var countdownBubbleView: UIView!
    @IBOutlet weak var iconBubbleView: UIView!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateLeftCountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countdownBubbleView.layer.cornerRadius = 10
        iconBubbleView.layer.cornerRadius = 10
        countdownBubbleView.backgroundColor = .white
        iconBubbleView.backgroundColor = .clear
        
        K.dropShadow(view: countdownBubbleView, shadowColor: UIColor.black)
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
