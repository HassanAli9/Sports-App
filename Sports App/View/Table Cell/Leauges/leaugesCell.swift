//
//  leaugesCell.swift
//  Sports App
//
//  Created by Hassan on 28/02/2022.
//

import UIKit
class leaugesCell: UITableViewCell {

 
    @IBOutlet weak var leaugeImg: UIImageView!
    
    @IBOutlet weak var leaugeNameLabel: UILabel!
    
    
    @IBOutlet weak var leaugeyoutubeBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(leauges:Countrys)
    {
        leaugeImg.sd_setImage(with: URL(string:leauges.strBadge! ), placeholderImage: UIImage(named: "photo2"))
        
        leaugeNameLabel.text = leauges.strLeague
        leaugeyoutubeBtn.addAction(UIAction(handler: { _ in
                        if let youTubeStr = leauges.strYoutube{
                            UIApplication.shared.open(URL(string: "https://\(youTubeStr)")! as URL, options: [:], completionHandler: nil)
                        }
                    }), for: .touchUpInside)
        
    }
    
    func configurCellFav(strTeam:String?, strName:String?, strYoutube:String?){
       
        if let imgL = strTeam{
        leaugeImg.sd_setImage(with: URL(string:imgL ), placeholderImage: UIImage(named: "photo2"))
        }
        guard let name = strName else{return}
        leaugeNameLabel.text = name
        
        leaugeyoutubeBtn.addAction(UIAction(handler: { _ in
                        if let youTubeStr = strYoutube{
                            UIApplication.shared.open(URL(string: "https://\(youTubeStr)")! as URL, options: [:], completionHandler: nil)
                        }
                    }), for: .touchUpInside)
    }

}
