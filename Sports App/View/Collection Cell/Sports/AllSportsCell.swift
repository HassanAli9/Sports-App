//
//  AllSports_Cell.swift
//  Sports App
//
//  Created by Hassan on 23/02/2022.
//

import UIKit

class AllSportsCell: UICollectionViewCell {
    
    @IBOutlet weak var spotrImg: UIImageView!
    @IBOutlet weak var sportNameLbl: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setCell(sport:Sport){
        
        spotrImg.sd_setImage(with: URL(string: sport.strSportThumb), placeholderImage: UIImage(named: "photo2"))
        
        
        sportNameLbl.text = sport.strSport
        
    }
    
}
