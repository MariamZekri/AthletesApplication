//
//  AthletesView.swift
//  Athletes
//
//  Created by mariam abdelhamid on 10/21/17.
//  Copyright © 2017 Mariam Abdelhamid. All rights reserved.
//

import Foundation

protocol AthletesView: NSObjectProtocol {
    
    func startLoading()
    func finishLoading()
    func sentSuccess(athletesData: ModAthletes, append: Bool)
    func sentFailed(error: Error?)
    
}
