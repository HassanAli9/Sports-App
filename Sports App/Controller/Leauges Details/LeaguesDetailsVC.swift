//
//  LeaguesDetailsVC.swift
//  Sports App
//
//  Created by Hassan on 01/03/2022.
//

import UIKit
import Alamofire
import CoreData


class LeaguesDetailsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var leauge : Countrys?
    
    var btn : UIBarButtonItem?

    var btnState:Bool?
    
    var leaugeCoreData = [LeaugeCoreData]()

       
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Called")
        btnState = getFromCoreData()

        navigationItem.largeTitleDisplayMode = .never


    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignbackground()
        cellRegisterd()
        btnState = getFromCoreData()

        if btnState!
        {btnSave()}
        else
        {btnDelete()}

        
    }
    
    func getFromCoreData() -> Bool
     {
         do{
             
             self.leaugeCoreData = try self.context.fetch(LeaugeCoreData.fetchRequest())
             
             for i in 0..<leaugeCoreData.count {
                 
                if leaugeCoreData[i].idLeauge == leauge?.idLeague
                 {
                  return  true
                    
                 }
                 else
                 {btnState = false}

             }
         }
         catch{
             print("Error Fetch")
         }
         
         return false

     }
    
    func cellRegisterd()
    {
        tableView.register(UpcomingEventsTBVCell.nib(), forCellReuseIdentifier: UpcomingEventsTBVCell.identifier)
        tableView.register(LatestResultsTBVCell.nib(), forCellReuseIdentifier: LatestResultsTBVCell.identifier)
        tableView.register(TeamsTBVCell.nib(), forCellReuseIdentifier: TeamsTBVCell.identifier)
    }
    
    
    @objc func saveLeauge()
    {
        let leaugeCoreData:LeaugeCoreData = LeaugeCoreData(context: context)
        leaugeCoreData.idLeauge = leauge?.idLeague
        leaugeCoreData.strBadge = leauge?.strBadge
        leaugeCoreData.strLeauge = leauge?.strLeague
        leaugeCoreData.strSport = leauge?.strSport
        leaugeCoreData.strYoutube = leauge?.strYoutube
        
        print("tapped method")
        do{
            try self.context.save()
            print("Save done")
        }catch{
            print("Error Core Data")
        }
    }
    
    
    @objc func deleteLeauge()
    {
        
        let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this leauge! ", preferredStyle: .alert)
        
        let actionOk = UIAlertAction(title: "Confirm", style: .default) { [self] _ in
            
            do{
                
                self.leaugeCoreData = try self.context.fetch(LeaugeCoreData.fetchRequest())
                
                for i in 0..<leaugeCoreData.count {
                    
                   if leaugeCoreData[i].idLeauge == leauge?.idLeague
                    {
                       self.context.delete(leaugeCoreData[i])
                       
                    }
                }
                try self.context.save()
                btnDelete()

            }
            catch{
                print("Error Fetch")
            }
        }
        
        let actionCansel = UIAlertAction(title: "Cancel", style: .cancel, handler: { [self]_ in
            btnSave()
        })
        
        alert.addAction(actionOk)
        alert.addAction(actionCansel)
        
        self.present(alert, animated: true, completion: nil)
    
         }


    
    func assignbackground(){
        
            let background = UIImage(named: "l")
            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleToFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
    
    func btnSave()
    {
        
        btn = UIBarButtonItem(image: UIImage(systemName: "star.fill") , style: .plain, target: self, action: #selector(checkState))
        btn?.tintColor = .orange
        navigationItem.rightBarButtonItem = btn
    }
    
    func btnDelete()
    {
        btn = UIBarButtonItem(image: UIImage(systemName: "star") , style: .plain, target: self, action: #selector(checkState))
        btn?.tintColor = .orange
        navigationItem.rightBarButtonItem = btn
    }
   
    
   @objc func checkState()
    {
        if btnState!
        {
            deleteLeauge()
            btnState = false

        }else
        {
            btnSave()
            saveLeauge()
            btnState = true
        }
        
    }


}
