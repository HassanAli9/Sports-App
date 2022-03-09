//
//  LatestResultsTBVInnerCell.swift
//  Sports App
//
//  Created by Hassan on 01/03/2022.
//

import UIKit

class LatestResultsTBVInnerCell: UITableViewCell {

    
    @IBOutlet weak var homeTeamNameLable: UILabel!
    
    @IBOutlet weak var awayTeamNameLable: UILabel!
    static let identifier = "latestResultsTBVInnerCell"
    
    static func nib() ->UINib{
        UINib(nibName: "LatestResultsTBVInnerCell", bundle: nil)
    }
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var awayTeamSccoreLabel: UILabel!
    
    @IBOutlet weak var homeTeamSccoreLabel: UILabel!
    
    @IBOutlet weak var matchDateLabel: UILabel!
    
    @IBOutlet weak var matchTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurCell(event : Event)
    {
        matchDateLabel.text = event.dateEvent
        homeTeamNameLable.text  = event.strHomeTeam
        awayTeamNameLable.text  = event.strAwayTeam
        matchTimeLabel.text = event.strTime
        homeTeamSccoreLabel.text = event.intHomeScore
        awayTeamSccoreLabel.text = event.intAwayScore
        img.sd_setImage(with: URL(string:event.strThumb!), placeholderImage: UIImage(named: "photo2"))
    }
     
}
