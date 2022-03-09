//
//  TeamsTBVCell+CV.swift
//  Sports App
//
//  Created by Hassan on 02/03/2022.
//

import Foundation
import UIKit


protocol CollectionViewInsideTableViewDelegate {
    func cellTaped(data:Team)
}



extension TeamsTBVCell : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        teamsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCVCell.identifier, for: indexPath) as! TeamsCVCell
        cell.configurCell(teams: teamsArr[indexPath.row])
        return cell
        
    }
}

extension TeamsTBVCell : UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.cellTaped(data: teamsArr[indexPath.row])
    
        
    }
}

extension TeamsTBVCell:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 , height: 105)
    }
}
