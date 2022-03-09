//
//  TeamsTBVCell.swift
//  Sports App
//
//  Created by Hassan on 02/03/2022.
//

import UIKit
import Alamofire

class TeamsTBVCell: UITableViewCell {
   
     var  delegate:CollectionViewInsideTableViewDelegate?

    @IBOutlet weak var collectionView: UICollectionView!
  
    var teamsArr : [Team] = []
    static let identifier = "teamsTBVCell"
    
    static func nib() ->UINib{
        UINib(nibName: "TeamsTBVCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(TeamsCVCell.nib(), forCellWithReuseIdentifier: TeamsCVCell.identifier)
        getLeaugeDetailsResultData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    /*
    */
    func getLeaugeDetailsResultData()
    {
        
        guard let leagueName = UserDefaults.standard.object(forKey: "strLeague") else {return}
                print(leagueName)
                let edit = (leagueName as AnyObject).replacingOccurrences(of: " ", with: "%20")
                guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=\(edit)") else {return}
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response {
            result in
            switch result.result {
          
            case .failure:
                print("Error")
                
            case .success:
                                
                guard let data = result.data else { return }
                
                let json = try! JSONDecoder().decode(Teams.self, from: data)
                
                guard let result = json.teams else {return}
                self.teamsArr = result
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    
}
