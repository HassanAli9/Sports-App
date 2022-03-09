//
//  AllSports_VC.swift
//  Sports App
//
//  Created by Hassan on 23/02/2022.
//

import Alamofire
import UIKit
import Reachability

class AllSportsVC: UIViewController {
    @IBOutlet var allSportsCollecotionView: UICollectionView!
   
    let reachability = try! Reachability()

    var sportsArr: [Sport] = []
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
            do{
              try reachability.startNotifier()
            }catch{
              print("could not start reachability notifier")
            }
    }
    
    @objc func reachabilityChanged(note: Notification) {

      let reachability = note.object as! Reachability

      switch reachability.connection {
      case .wifi:
          print("Reachable via WiFi")
      case .cellular:
          print("Reachable via Cellular")
      case .unavailable:
        print("Network not reachable")
      default:
          print("Non")
      }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "b1")!)
        assignbackground()
        getDataUsingAlamofire()
        


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
    
    private func getDataUsingAlamofire() {
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/all_sports.php") else { return }
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response {
            result in
            switch result.result {
          
            case .failure:
                print("Error")
                
            case .success:
                                
                guard let data = result.data else { return }
                
                let json = try! JSONDecoder().decode(Sports.self, from: data)
                
                self.sportsArr = json.sports
                
                DispatchQueue.main.async {
                    self.allSportsCollecotionView.reloadData()
                }
            }
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
