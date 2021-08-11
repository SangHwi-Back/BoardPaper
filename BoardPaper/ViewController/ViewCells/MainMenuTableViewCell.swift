//
//  MainMenuTableViewCell.swift
//  BoardPaper
//
//  Created by 백상휘 on 2021/08/03.
//

import UIKit

class MainMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var menuTitleLabel: UILabel!
    @IBOutlet weak var boardCount: UILabel!
    
    var data: MainMenu?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindTableView() {
        menuTitleLabel.text = data?.menu_name
        
    }

}
