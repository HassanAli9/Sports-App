//
//  LeaguesDetails+TBV.swift
//  Sports App
//
//  Created by Hassan on 01/03/2022.
//

import Foundation
import UIKit
extension LeaguesDetailsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        switch indexPath.section {
        case 0:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: TeamsTBVCell.identifier, for: indexPath) as! TeamsTBVCell
            cell3.delegate = self
            return cell3
            
        case 1:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: UpcomingEventsTBVCell.identifier, for: indexPath) as! UpcomingEventsTBVCell
            return cell1
           
        case 2:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: LatestResultsTBVCell.identifier, for: indexPath) as! LatestResultsTBVCell
            return cell2
        default:
            print("NO CELL")
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var str = ""
   
        switch section {
        case 0:
            str = "Teams"
        case 1:
            str = "Upcoming Events"
        case 2:
            str = "Results"
        default:
            str = ""
        }
        return str
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            // headerView.contentView.backgroundColor = .white
            headerView.backgroundView?.backgroundColor = .black
            headerView.textLabel?.textColor = .white
        }
    }
}

extension LeaguesDetailsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var num: Int
        
        switch indexPath.section {
        case 0:
            num = 105

        case 1:
            num = 177
            
        case 2:
            num = 290
        default:
            num = 0
        }
        return CGFloat(num)
    }
}


extension LeaguesDetailsVC : CollectionViewInsideTableViewDelegate
{
    func cellTaped(data: Team) {
        let vc   = self.storyboard?.instantiateViewController(withIdentifier: "teamsVC") as! TeamsVC
        vc.team = data
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
