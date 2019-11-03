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
extension ViewController: UITextViewDelegate,FUIAuthDelegate{
    //MARK: Action Method
    @IBAction func postButtonClicked() {
        loginWithTwitter()
        if textView.text.isEmpty() {
            Utilities.showAlert(Constants.alert, message:Constants.enterTextAlert, viewController: self)
            return;
        }
        
        
        let result =  Utilities.splistMessage(message: textView.text)
        if(result.count > 0){
            self.showMessageListObj.setMessagesList(messagesList: result)
            self.showMessageListObj.showHideView()
            self.showMessageListObj.reloadTableView()
        }else{
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
    
    func loginWithTwitter(){
        /*
         let credential = TwitterAuthProvider.credential(withToken: "2577049070-FS8JO0PZzYfxes7MnFfJHLdgvdz5zhm2EXmAkfY", secret: "KIMH8LtNJZ5C2CcNAMqj4rGAOvJKNdjVuTUSAsNxw1ORO")
         
         Auth.auth().createUser(withEmail: "adnanqadir12@yahoo.com", password: "abctest") { (authResult, error) in
         if error != nil {
         // Handle error.
         }
         // User is signed in.
         // IdP data available in authResult.additionalUserInfo.profile.
         // Twitter OAuth access token can also be retrieved by:
         // authResult.credential.accessToken
         // Twitter OAuth ID token can be retrieved by calling:
         // authResult.credential.idToken
         // Twitter OAuth secret can be retrieved by calling:
         // authResult.credential.secret
         print(authResult?.user.email as Any)
         }
         */
        /*
         TWTRTwitter.sharedInstance().logIn(with: self) { (session, error) in
         if (session != nil) {
         print("signed in as \(session!.userName)");
         } else {
         print("error: \(error!.localizedDescription)");
         }
         }
         */
        /*
         TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
         if (session != nil) {
         print("signed in as \(session!.userName)");
         } else {
         print("error: \(error!.localizedDescription)");
         }
         })
         }
         */
        
        /*
         Auth.auth().signInAndRetrieveData(with: credential) { authResult, error in
         if error != nil {
         // Handle error.
         }
         // User is signed in.
         // IdP data available in authResult.additionalUserInfo.profile.
         // Twitter OAuth access token can also be retrieved by:
         // authResult.credential.accessToken
         // Twitter OAuth ID token can be retrieved by calling:
         // authResult.credential.idToken
         // Twitter OAuth secret can be retrieved by calling:
         // authResult.credential.secret
         print(authResult?.user.email as Any)
         }
         
         }
         */
        /*
         let authUI = FUIAuth.defaultAuthUI()
         // You need to adopt a FUIAuthDelegate protocol to receive callback
         authUI!.delegate = (self as FUIAuthDelegate)
         
         let providers: [FUIAuthProvider] = [
         FUITwitterAuth()
         ]
         authUI!.providers = providers
         let authViewController = authUI!.authViewController()
         self.present(authViewController, animated: true, completion: nil)
         */
    }
    
    func showMessageListVC(){
        if(showMessageListObj == nil){
            showMessageListObj = self.storyboard?.instantiateViewController(identifier: Constants.messageVCIdentifier)
            
            self.addChild(self.showMessageListObj!)
            self.showMessageListObj!.didMove(toParent: self)
            self.view.addSubview(self.showMessageListObj.view)
            self.showMessageListObj.showHideView()
        }
        
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        // handle user and error as necessary
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

