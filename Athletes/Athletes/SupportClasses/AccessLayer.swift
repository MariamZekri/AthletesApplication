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
        NetworkHelper.networkRequester(domainUrl: Constants.domainUrl, service: Constants.getAthletesUrl, contentType: nil, hTTPMethod: .get, parameters: parameters, httpBody: nil, httpBodyData: nil, responseType: .StringJson, callbackNoInterent: {
            
        }, callbackString: { (response) in
            
            if(response.result.isFailure)
            {
                
                print(response.result.error?.localizedDescription as Any);
                failure(response.result.error?.localizedDescription)
                
            }
            
            if(response.result.isSuccess)
            {
                if let JSON = response.result.value
                {
                    print("JSON: \(JSON)")
                    
                    let res = ModAthletes(JSONString: JSON) //success
                    
                    sucess(res!)
                    
                }
            }
            
            
        }, callbackSwiftyDic: nil)

    }
    
    
    
}

