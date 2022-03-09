//
//  TeamsCVCell.swift
//  Sports App
//
//  Created by Hassan on 02/03/2022.
//

import UIKit

class TeamsCVCell: UICollectionViewCell {

    @IBOutlet weak var badge: UIImageView!
    static let identifier = "teamsCVCell"
    
    static func nib() ->UINib{
        UINib(nibName: "TeamsCVCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configurCell(teams : Team ){
        
        guard let badge1 = teams.strTeamBadge else{return}
        
        badge.sd_setImage(with: URL(string:badge1), placeholderImage: UIImage(named: "photo2"))
    }
    
   
    
}
