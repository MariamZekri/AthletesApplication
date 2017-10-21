//
//  ViewController.swift
//  Athletes
//
//  Created by mariam abdelhamid on 10/19/17.
//  Copyright © 2017 Mariam Abdelhamid. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll
import NVActivityIndicatorView
import Kingfisher


class AthletesViewController: UIViewController {
    
    
    @IBOutlet weak var athletesTableView: UITableView!
    private let athletesPresenter = AthletesPresenter(service: AccessLayer())
    var athletesDataList:ModAthletes!
    var athletesArr:[Athlete] = []

    let refresher = UIRefreshControl()
    var activityProgress: NVActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        athletesPresenter.attachView(view: self)
        athletesPresenter.getAthletesData(infiniteRefresher: false, displayIndicator: true)
        
        // Add indicator
        let progressSize = CGRect(x: self.view.bounds.width/2 - 67.0, y: self.view.bounds.height/2 - 67.0, width: 134.0, height: 134.0)
        activityProgress = self.setNVActivityIndicatorView(viewController: self, rectProgress: progressSize, progressType: .ballScaleMultiple, progressColor:UIColor.init(red: 15 / 255, green: 100 / 255, blue: 129 / 255
            , alpha: 1.0) )
        
        // Register followers cell
        self.athletesTableView.register(TcAthletes.self, forCellReuseIdentifier: "TcAthletes")
        self.athletesTableView.register(UINib(nibName: "TcAthletes",bundle: nil), forCellReuseIdentifier: "TcAthletes")
        
        
        // Automatic Height for tableView
        athletesTableView.rowHeight = UITableViewAutomaticDimension
        athletesTableView.estimatedRowHeight = 88
        
        // Add refresher to table view
        refresher.addTarget(self, action: #selector(refresh), for: .valueChanged)
        athletesTableView.addSubview(refresher)
        
        // Add infinite scroll to table view
        athletesTableView.addInfiniteScroll { (UITableView) in
            
            if self.athletesDataList != nil {
                self.athletesPresenter.getAthletesData(infiniteRefresher: true, displayIndicator: false)
                
            }else {
                self.athletesTableView.finishInfiniteScroll()
                
            }
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func refresh()
    {
        athletesPresenter.getAthletesData(infiniteRefresher: false, displayIndicator: false)
    }
    
}



extension AthletesViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TcAthletes") as! TcAthletes
        
        cell.selectionStyle = .none
        
        let data = athletesArr[indexPath.row]
        
        cell.athletesName.text = data.name
        cell.athletesImg.kf.setImage(with: URL(string: data.image!))
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "followerToTimline", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    
}

extension AthletesViewController:AthletesView {
    
    func startLoading() {
        self.activityProgress?.startAnimating()
    }
    
    func finishLoading() {
        
        refresher.endRefreshing()
        //followersTable.finishInfiniteScroll()
        self.activityProgress?.stopAnimating()
    }
    
    func sentSuccess(athletesData: ModAthletes, append: Bool) {
        
        if append {
            athletesDataList = athletesData
           // athletesDataList.append(contentsOf: athletesData.users!)
            
        }else {
            athletesDataList = athletesData
            //athletesDataList = athletesData.users!
        }
        
       // followersTable.reloadData()
        
    }
    
    func sentFailed(error: Error?) {
        //        if error == "fail" {
        //
        //            self.alert(title: Language.localizeStringForKey(word: "error"), message: Language.localizeStringForKey(word: "something_went_wrong"), viewController: self)
        //        }else {
        //
        //            self.alert(title: Language.localizeStringForKey(word: "error"), message: error, viewController: self)
        //
        //        }
    }

    
}
