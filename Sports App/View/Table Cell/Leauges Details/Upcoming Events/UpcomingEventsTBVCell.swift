//
//  UpcomingEventsTBVCell.swift
//  Sports App
//
//  Created by Hassan on 01/03/2022.
//

import UIKit
import Alamofire
class UpcomingEventsTBVCell: UITableViewCell {

    static let identifier = "upcomingEventsTBVCell"
    var upcomingArr:[Event] = []

    @IBOutlet weak var collectionView: UICollectionView!

    static func nib() -> UINib{
     return   UINib(nibName: "UpcomingEventsTBVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UpcomingEventsCVCell.nib(), forCellWithReuseIdentifier: UpcomingEventsCVCell.identifier)
        getLeaugeDetails()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    func getLeaugeDetails()
    {
        guard let idLeauge = UserDefaults.standard.object(forKey: "idLeague") else {return}
        
        print("id leaugessssss\(String(describing: idLeauge))")
        
        guard let url = URL(string:     "https://www.thesportsdb.com/api/v1/json/2/eventsround.php?id=\(idLeauge)&r=30") else { return }
        
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response {
            result in
            switch result.result {
          
            case .failure:
                print("Error")
                
            case .success:
                                
                guard let data = result.data else { return }
                
                let json = try! JSONDecoder().decode(UpcomingAndResults.self, from: data)
                
                guard let upcoming = json.events else {return}
                self.upcomingArr = upcoming
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}
