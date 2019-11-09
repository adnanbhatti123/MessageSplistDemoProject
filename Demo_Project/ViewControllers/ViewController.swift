//
//  ViewController.swift
//  Demo_Project
//
//  Created by MAC on 02/11/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView:UITextView!
    @IBOutlet weak var postButton:UIButton!
    var showMessageListObj:ShowMessagesListVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.text = Constants.text
        showMessageListVC()
        print(checkNoOfRepetitions(array: [2,3,4,3,2,1,3], repetedNo: 3))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func checkNoOfRepetitions(array:[Int],arrayLength:Int) -> Int{
        var numbOfRepetition = 0
        for i in 0..<array.count{
            if(repetedNo == array[i]){
                numbOfRepetition = numbOfRepetition + 1
            }
        }
        return numbOfRepetition
        
    }
}

