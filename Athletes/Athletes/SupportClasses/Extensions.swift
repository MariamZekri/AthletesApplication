//
//  Extensions.swift
//  Tooli
//
//  Created by mariam abdelhamid on 9/4/17.
//  Copyright © 2017 Vapps. All rights reserved.
//
import Foundation
import NVActivityIndicatorView

extension UIViewController {
    
    func alert(title: String, message: String, viewController: UIViewController ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func setNVActivityIndicatorView(viewController: UIViewController, rectProgress:CGRect,progressType: NVActivityIndicatorType, progressColor: UIColor) -> (NVActivityIndicatorView) {
        
        var activityProgress: NVActivityIndicatorView?
        activityProgress = NVActivityIndicatorView(frame: rectProgress, type: progressType, color: progressColor, padding: 12)
        viewController.view.addSubview(activityProgress!)
        viewController.view.bringSubview(toFront: activityProgress!)
        
        return activityProgress!
    }
    
}
