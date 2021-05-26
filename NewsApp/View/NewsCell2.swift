//
//  NewsCell2.swift
//  NewsApp
//
//  Created by Kaushal Topinkatti B on 26/05/21.
//

import UIKit

class NewsCell2: UITableViewCell {

    @IBOutlet weak var sourceName: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsBox: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsBox.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        newsBox.layer.shadowOpacity = 0.4
        newsBox.layer.shadowOffset = CGSize.zero
        newsBox.layer.shadowRadius = 6
        newsBox.layer.cornerRadius = 10
        
        newsImage.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
