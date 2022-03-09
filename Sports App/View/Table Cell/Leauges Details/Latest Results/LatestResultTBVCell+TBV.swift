//
//  LatestResultTBVCell+TBV.swift
//  Sports App
//
//  Created by Hassan on 01/03/2022.
//

import Foundation
import UIKit


extension LatestResultsTBVCell : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resultsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: LatestResultsTBVInnerCell.identifier, for: indexPath) as! LatestResultsTBVInnerCell
        
        
        cell.configurCell(event: resultsArr[indexPath.row])
        return cell
    }
}


extension LatestResultsTBVCell : UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 177
    }
    
    
    
}


