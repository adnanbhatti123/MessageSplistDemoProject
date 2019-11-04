//
//  ShowMessagesListVC.swift
//  Demo_Project
//
//  Created by MAC on 03/11/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class ShowMessagesListVC: UIViewController{
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var cancelButton:UIButton!
    @IBOutlet weak var sendButton:UIButton!
    var messagesList = [String]()
    weak var delegate:ShowMessageListDelegate?
    override func viewDidLoad() {
        
    }
    
}
