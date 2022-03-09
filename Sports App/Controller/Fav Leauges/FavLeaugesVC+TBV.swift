//
//  File.swift
//  Sports App
//
//  Created by Hassan on 03/03/2022.
//

import Foundation
import UIKit

extension FavLeaugesVC : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaugeCoreData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaugesCell" , for: indexPath) as! leaugesCell

        
        
        cell.configurCellFav(strTeam: leaugeCoreData[indexPath.row].strBadge , strName: leaugeCoreData[indexPath.row].strLeauge, strYoutube: leaugeCoreData[indexPath.row].strYoutube)
        
        
        return cell
    }
    

}



extension FavLeaugesVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this leauge! ", preferredStyle: .alert)
            
            let actionOk = UIAlertAction(title: "Confirm", style: .default) { [self] _ in
                let selectedLeauge = self.leaugeCoreData[indexPath.row]
                self.context.delete(selectedLeauge)
                do{
                    try self.context.save()
                }
                catch{
                    print("Error Delete")
                }
                
                self.getFromCoreData()
            }
            
            let actionCansel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(actionOk)
            alert.addAction(actionCansel)
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsVC") as! LeaguesDetailsVC
        
        UserDefaults.standard.set(leaugeCoreData[indexPath.row].idLeauge, forKey: "idLeague")
        
        UserDefaults.standard.set(leaugeCoreData[indexPath.row].strLeauge, forKey: "strLeague")
        
       // vc.leauge = leaugeCoreData[indexPath.row ]
        navigationController?.pushViewController(vc, animated: true)
    }
}
