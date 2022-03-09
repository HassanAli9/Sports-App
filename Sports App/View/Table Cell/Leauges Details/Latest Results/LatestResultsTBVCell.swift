//
//  LatestResultsTBVCell.swift
//  Sports App
//
//  Created by Hassan on 01/03/2022.
//

import UIKit
import Alamofire

class LatestResultsTBVCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    static let identifier = "latestResultsTBVCell"
    var resultsArr:[Event] = []

    static func nib() ->UINib{
        UINib(nibName: "LatestResultsTBVCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        tableView.register(LatestResultsTBVInnerCell.nib(), forCellReuseIdentifier: LatestResultsTBVInnerCell.identifier)
        getLeaugeDetailsResultData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getLeaugeDetailsResultData()
    {
        guard let idLeauge = UserDefaults.standard.object(forKey: "idLeague") else {return}
        
        print("id leaugessssss\(String(describing: idLeauge))")
        
        guard let url = URL(string:     "https://www.thesportsdb.com/api/v1/json/2/eventsround.php?id=\(idLeauge)&r=21") else { return }
        
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response {
            result in
            switch result.result {
          
            case .failure:
                print("Error")
                
            case .success:
                                
                guard let data = result.data else { return }
                
                let json = try! JSONDecoder().decode(UpcomingAndResults.self, from: data)
                
                guard let result = json.events else {return}
                self.resultsArr = result
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
  
}
