//
//  FavLeaugesVC.swift
//  Sports App
//
//  Created by Hassan on 03/03/2022.
//

import UIKit
import CoreData

class FavLeaugesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var leaugeCoreData = [LeaugeCoreData]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("CALLED")
        getFromCoreData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        assignbackground()
        tableView.reloadData()
    }
    
    func assignbackground(){
            let background = UIImage(named: "b1")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleToFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
    
   func getFromCoreData()
    {
        do{
            self.leaugeCoreData = try self.context.fetch(LeaugeCoreData.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            print("Error Fetch")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
