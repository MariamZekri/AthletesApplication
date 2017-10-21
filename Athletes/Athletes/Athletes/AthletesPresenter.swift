//
//  AthletesPresenter.swift
//  Athletes
//
//  Created by mariam abdelhamid on 10/21/17.
//  Copyright © 2017 Mariam Abdelhamid. All rights reserved.
//

import Foundation

class AthletesPresenter {
    
    private let accessLayer:AccessLayer
    weak private var athletesView : AthletesView?
    
    
    init(service:AccessLayer){
        self.accessLayer = service
    }
    
    func attachView(view:AthletesView){
        athletesView = view
    }
    
    func getAthletesData(infiniteRefresher: Bool, displayIndicator: Bool) {
        
        if displayIndicator {
            self.athletesView?.startLoading()
        }
        
        
        AccessLayer.apiAthletesList(parameters: [:], sucess: { (ModAthletes) in
            
            self.athletesView?.sentSuccess( athletesData: ModAthletes, append: infiniteRefresher)
            self.athletesView?.finishLoading()
            
        }, failure: { (err) in
            
            
            self.athletesView?.sentFailed(error: err! as? Error)
            self.athletesView?.finishLoading()
            
        }, noInternet: { (offlineCachedObject) in
            print("❌❌❌ no Internet in getAthletesData")
            
            if offlineCachedObject != nil {
                
                self.athletesView?.sentSuccess(athletesData: offlineCachedObject!, append: infiniteRefresher)
                
            }else {
                
                self.athletesView?.sentFailed(error: "no Internet" as? Error)
            }
            
            self.athletesView?.finishLoading()

        })
        
        
    }
}
