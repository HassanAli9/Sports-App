//
//  AllSports_VC+CollectionView.swift
//  Sports App
//
//  Created by Hassan on 23/02/2022.
//

import Foundation
import SDWebImage
import UIKit

extension AllSportsVC:UICollectionViewDataSource
    
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AllSportsCell
        
        cell.setCell(sport: sportsArr[indexPath.row])
        
        return cell
    }
    
   
}


extension AllSportsVC : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let leaugesVc = storyboard?.instantiateViewController(withIdentifier: "leaugesVC") as! LeaugesVC
        
        leaugesVc.leaugeName = sportsArr[indexPath.row].strSport
        
        navigationController?.pushViewController(leaugesVc, animated: true)
    }
    
}

extension AllSportsVC : UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width * 0.45) , height: self.view.frame.width * 0.38)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
