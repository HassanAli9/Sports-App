//
//  UpcomingEventsCell.swift
//  Sports App
//
//  Created by Hassan on 01/03/2022.
//

import UIKit

class UpcomingEventsCVCell: UICollectionViewCell {

    @IBOutlet weak var matchDateLable: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var awayTeamLable: UILabel!
    
    @IBOutlet weak var matchTimeLable: UILabel!
    @IBOutlet weak var homeTeamLable: UILabel!
    
    static let identifier = "upcomingEventsCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "UpcomingEventsCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configurCell(event : Event)
    {
        matchDateLable.text = event.dateEvent
        homeTeamLable.text  = event.strHomeTeam
        awayTeamLable.text  = event.strAwayTeam
        matchTimeLable.text = event.strTime
        img.sd_setImage(with: URL(string:event.strThumb!), placeholderImage: UIImage(named: "photo2"))
    }

}
