//
//  LeaugesVC.swift
//  Sports App
//
//  Created by Hassan on 28/02/2022.
//

import UIKit
import Alamofire
class LeaugesVC: UIViewController {
   
    
    @IBOutlet weak var leaugesTBV: UITableView!
    
    var leaugeName:String!
    var leaugeArr:[Countrys] = []
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getLeaugeData()

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
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        navigationItem.title = leaugeName
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "b1")!)
        // Do any additional setup after loading the view.
    }
    

    func getLeaugeData()
    {
  
        let newString = leaugeName.replacingOccurrences(of: " ", with: "%20")
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?c=England&s=\(newString)") else { return }
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response {
            result in
            switch result.result {
          
            case .failure:
                print("Error")
                
            case .success:
                                
                guard let data = result.data else { return }
                
                let json = try! JSONDecoder().decode(Leauges.self, from: data)
                
                guard let leauge = json.countrys else {return}
                self.leaugeArr = leauge
                
                DispatchQueue.main.async {
                    self.leaugesTBV.reloadData()
                }
            }
        }
    }
   
}
