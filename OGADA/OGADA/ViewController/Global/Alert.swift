//
//  Alert.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/13.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class Alert: UIAlertController {
    
        
    func noticeAlertDisplay(
        target: UIViewController,
        actionTitle: String = "확인",
        completionHandler: (() -> Void)?) {
        
        let okAction = UIAlertAction(title: actionTitle, style: .default, handler: {
            _ in
            completionHandler?()
        })
        addAction(okAction)
        target.present(self, animated: true)
    }
    
    
    
    func defaultAlertDisplay(
        target: UIViewController,
        actionTitle: String = "확인",
        cancelTitle: String = "취소",
        completionHandler: (() -> Void)? = nil) {
        
        let okAction = UIAlertAction(title: actionTitle, style: .default, handler: {
            _ in
            completionHandler?()
        })
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel)
        
        addAction(okAction)
        addAction(cancelAction)
        
        target.present(self, animated: true)
    }
    
    func freeAlertDisplay(
        target: UIViewController,
        actions: [UIAlertAction]) {
        
        actions.forEach({
            addAction($0)
        })
        target.present(self, animated: true)
    }
    
}
