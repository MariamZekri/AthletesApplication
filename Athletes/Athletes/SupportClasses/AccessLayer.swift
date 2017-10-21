//
//  AccessLayer.swift
//  Athletes
//
//  Created by mariam abdelhamid on 10/19/17.
//  Copyright © 2017 Mariam Abdelhamid. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper
import Alamofire


class AccessLayer {
    
    //#MARK:- GetAthletesList
    internal static func apiAthletesList(parameters: [String : Any],sucess: @escaping ((_ atheletesInfo: ModAthletes ) -> Void), failure:@escaping (( _ NSError: String?) -> Void), noInternet:@escaping ((_ atheletesCachedInfo: ModAthletes?) -> Void))
    {
        
        NetworkHelper.networkRequester(domainUrl: nil, service: Constants.getAthletesUrl, contentType: nil, hTTPMethod: .get, parameters: parameters, callbackNoInterent: {

            
        }) { (json, error) in
            
            if json != JSON.null {
                
                let res = ModAthletes(JSON: json.dictionaryObject!)
                
                print("Result \(String(describing: res))")
                
                sucess(res!)
                
            }else {
                
                if let err = error?.localizedDescription {
                    failure(err)
                }else {
                    failure("fail")
                }
            }
            
        }
    }
    
    
    
}

