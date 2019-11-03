//
//  Utilities.swift
//  Demo_Project
//
//  Created by MAC on 02/11/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    //MARK: Split message into chunks
     class func splistMessage(message:String) -> [String]{
        if(message.length <= 50){
            return [message];
        }
        
        var resultArray = [String]()
        var resultString:String = ""
        var totalChunks = message.length/(Constants.chunkSize + 1)
        
        if(message.length % Constants.chunkSize != 0){
            totalChunks = totalChunks + 1
        }
        
        for  i in 0..<totalChunks{
            let remainingMessage = (message.length - (resultArray.count * Constants.chunkSize)) - (totalChunks - 1)
            
            if(i < totalChunks - 1 && message[(((i+1)*Constants.chunkSize)) + i] != " " ){
                return  [String]()
            }
            
            if(remainingMessage < Constants.chunkSize){
                resultString = message[((i*Constants.chunkSize) + i) ..<  (((i*Constants.chunkSize) + i)+remainingMessage)]
            }else{
                resultString = message[((i*Constants.chunkSize) + i) ..< (((i+1)*Constants.chunkSize)) + i]
            }
            
            if(resultString.isEmpty()){
                continue;
            }
            
            resultArray.append(resultString)
            resultString = ""
        }
        
        for i in 0..<resultArray.count{
            resultArray[i] = "\(i+1)/\(resultArray.count) \(resultArray[i])"
        }
        
        return resultArray
    }
    
    //MARK: Show Alert
    class func showAlert(_ titleValue:String, message:String,viewController:UIViewController){
        let alert = UIAlertController(title: titleValue, message:message , preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title:"Ok", style: UIAlertAction.Style.default, handler: { (action) in
            
        }))
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
}

