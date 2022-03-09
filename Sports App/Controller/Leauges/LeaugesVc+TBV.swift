//
//  File.swift
//  Sports App
//
//  Created by Hassan on 28/02/2022.
//

import Foundation
import UIKit

// MARK: - TableViewDataSource

extension LeaugesVC : UITableViewDataSource{
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaugeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaugesCell" , for: indexPath) as! leaugesCell
        
        cell.setCell(leauges: leaugeArr[leaugeArr.count - indexPath.row - 1])
        
        return cell
    }
    
    

    
    
}

// MARK: - TableViewDelegate

extension LeaugesVC : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     
        let LeaguesDetailsVC = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsVC") as! LeaguesDetailsVC
        
        UserDefaults.standard.set(leaugeArr[leaugeArr.count - indexPath.row - 1].idLeague, forKey: "idLeague")
        
        UserDefaults.standard.set(leaugeArr[leaugeArr.count - indexPath.row - 1].strLeague, forKey: "strLeague")
        
        LeaguesDetailsVC.leauge = leaugeArr[leaugeArr.count - indexPath.row - 1]
        navigationController?.pushViewController(LeaguesDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    

}





