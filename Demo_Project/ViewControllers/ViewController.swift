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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

