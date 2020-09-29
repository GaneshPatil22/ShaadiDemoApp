//
//  AppUtil.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/29/20.
//

import UIKit

class AppUtil {
    class func showMessage(_ messageText:String, messageTitle:String, buttonTitle:String,
                           completionHandler: (() -> ())? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: messageTitle, message: messageText, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: buttonTitle, style: .default) {_ in
                completionHandler?()
            }
            alert.addAction(okAction)
            var topVC = UIApplication.shared.keyWindow?.rootViewController
            while((topVC!.presentedViewController) != nil){
                 topVC = topVC!.presentedViewController
            }
            topVC?.present(alert, animated: true, completion: nil)
        }
    }
}
