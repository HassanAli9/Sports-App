//
//  TeamsVC.swift
//  Sports App
//
//  Created by Hassan on 02/03/2022.
//

import UIKit

class TeamsVC: UIViewController {
    @IBOutlet weak var badgeImg: UIImageView!
    
    @IBOutlet weak var teshirtImg: UIImageView!
    var team:Team?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        assignbackground()

        badgeImg.sd_setImage(with: URL(string:(team?.strTeamBadge!)!), placeholderImage: UIImage(named: "photo2"))
        
        guard let imgS = team?.strTeamJersey else {return}
        teshirtImg.sd_setImage(with: URL(string:(imgS)), placeholderImage: UIImage(named: "photo2"))
        // Do any additional setup after loading the view.
    }
    
    
    func assignbackground(){
        
            
            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleToFill
            imageView.clipsToBounds = true

        guard let imgS = team?.strStadiumThumb else {return}
        
        imageView.sd_setImage(with: URL(string:(imgS)), placeholderImage: UIImage(named: "photo2"))
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
