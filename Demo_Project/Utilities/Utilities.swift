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
        var characterDivided = 0
        while characterDivided < message.length {
            var messageChunk = message[characterDivided ..< (Constants.chunkSize + characterDivided)]
            let remainingCharacters = message.length - characterDivided
            if(remainingCharacters <= Constants.chunkSize ){
                resultArray.append(messageChunk)
                characterDivided = characterDivided + Constants.chunkSize
                break
            }else{
                if(messageChunk.contains(" ") || messageChunk.contains("\n")){
                    var spaceIndex = 0
                    let reversedCollection = (0 ..< messageChunk.length).reversed()
                    for i in reversedCollection{
                        if(messageChunk[i] == " "){
                            spaceIndex = i
                            break
                        }
                    }
                    if (spaceIndex < Constants.chunkSize - 1){
                        messageChunk = message[characterDivided ..< (spaceIndex + characterDivided)]
                        resultArray.append(messageChunk)
                        characterDivided = characterDivided + messageChunk.length + 1
                        
                    }else{
                        resultArray.append(String(messageChunk.dropLast()))
                        characterDivided = characterDivided + Constants.chunkSize
                    }
                    
                    
                }else{
                    return  [String]()
                }
            }
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

