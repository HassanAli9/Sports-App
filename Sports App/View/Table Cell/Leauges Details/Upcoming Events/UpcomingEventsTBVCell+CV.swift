//
//  ex.swift
//  Sports App
//
//  Created by Hassan on 01/03/2022.
//

import Foundation
import UIKit



extension UpcomingEventsTBVCell : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        upcomingArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingEventsCVCell.identifier, for: indexPath) as! UpcomingEventsCVCell
        
        cell.configurCell(event: upcomingArr[indexPath.row])
        
        return cell
    }
}


extension UpcomingEventsTBVCell : UICollectionViewDelegate
{}


extension UpcomingEventsTBVCell : UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 309 , height: 177)
    }
   
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
     */

   
    
}
