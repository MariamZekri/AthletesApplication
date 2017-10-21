//
//  AthletesDetailsViewController.swift
//  Athletes
//
//  Created by mariam abdelhamid on 10/21/17.
//  Copyright © 2017 Mariam Abdelhamid. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll
import NVActivityIndicatorView
import Kingfisher

class AthletesDetailsViewController: UIViewController {

    @IBOutlet weak var athleteImg: UIImageView!
    
    @IBOutlet weak var athleteName: UILabel!
    
    @IBOutlet weak var athleteBreif: UITextView!

    var athletesData:Athlete!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Athlete Info"
        // Do any additional setup after loading the view.
        
        setUserData()
        
    }

    
    func setUserData() {
        
        athleteName.text = athletesData.name ?? ""
        athleteBreif.text = athletesData.brief ?? ""
        athleteImg.kf.setImage(with: URL(string: athletesData.image ?? "") , placeholder: UIImage(named: "image"), options: nil, progressBlock: nil, completionHandler: nil)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */







    
}
