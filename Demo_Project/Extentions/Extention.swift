//
//  Extention.swift
//  Demo_Project
//
//  Created by MAC on 03/11/2019.
//  Copyright © 2019 MAC. All rights reserved.
//
import UIKit
import TwitterKit
import Firebase
import FirebaseUI

// MARK: ViewController extention
extension ViewController: UITextViewDelegate,FUIAuthDelegate,ShowMessageListDelegate{
  
    
    //MARK: Action Method
    @IBAction func postButtonClicked() {
       if textView.text.isEmpty() {
            Utilities.showAlert(Constants.alert, message:Constants.enterTextAlert, viewController: self)
            return;
        }
        
        
        let result =  Utilities.splistMessage(message: textView.text)
        if (result.count == 1){
            Utilities.showAlert(Constants.alert, message:Constants.messageSentAlert, viewController: self)
        }
        else if(result.count > 1){
            self.showMessageListObj.setMessagesList(messagesList: result)
            self.showMessageListObj.showHideView()
            self.showMessageListObj.reloadTableView()
        }
        else{
            Utilities.showAlert(Constants.alert, message:Constants.formattingAlert, viewController: self)
        }
    }
    
    //MARK: TextView Delegate
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    //MARK: Initialize MessageListVC
    func showMessageListVC(){
        if(showMessageListObj == nil){
            showMessageListObj = self.storyboard?.instantiateViewController(identifier: Constants.messageVCIdentifier)
            showMessageListObj.delegate = self
            self.addChild(self.showMessageListObj!)
            self.showMessageListObj!.didMove(toParent: self)
            self.view.addSubview(self.showMessageListObj.view)
            self.showMessageListObj.showHideView()
        }
        
    }
    
    
    
    // MARK: Post Message
    func postMessge() {
        Utilities.showAlert(Constants.alert, message: Constants.messageSentAlert, viewController: self)
      }
    
}

// MARK: Show Messages List Delegate
extension ShowMessagesListVC:UITableViewDelegate,UITableViewDataSource{
    
    // MARK: UITableView Delegates And DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messagesList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier)!
        let label = cell.contentView.viewWithTag(Constants.cellLabelTag) as! UILabel
        label.text = self.messagesList[indexPath.row]
        return cell
    }
    
    // MARK: IBAction Methods
    @IBAction func sendButtonClicked(){
        self.delegate?.postMessge()
        showHideView()
    }
    
    @IBAction func  cancelButtonClicked(){
        showHideView()
    }
    
    // MARK: Custom Methods
    func setMessagesList(messagesList:[String]){
        self.messagesList = messagesList
    }
    
    func showHideView(){
        self.view.isHidden = !self.view.isHidden
    }
    
    func reloadTableView(){
        self.tableView.reloadData()
    }
}

// MARK: String extention
extension String {
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    func isEmpty() ->Bool{
        if self.trimmingCharacters(in: .whitespaces).isEmpty {
            return true
        }
        return false
    }
    
    
}

//MARK: Add border layer and color
extension UIView: Traceable {

    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return  UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
}

