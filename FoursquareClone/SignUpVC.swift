//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Atakan Aktakka on 17.09.2023.
//

import UIKit
import Parse

class SignUpVC: UIViewController {

    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //print(currentUser?.username)
        
     /* veri kayıt etmek
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Banana"
        parseObject["calories"] = 200
        parseObject.saveInBackground { success, error in
            if error != nil{
                print(error?.localizedDescription)
            }else{
                print("uploaded")
            }
        }
        */
        /* veri çekmek
        let query = PFQuery(className: "Fruits")
        query.whereKey("name", equalTo: "Apple")
        query.findObjectsInBackground { objects, error in
            if error != nil{
                print(error?.localizedDescription)
            }else{
                print(objects)
            }
        }*/
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        if userNameText.text != "" && passwordText.text != ""{
            PFUser.logInWithUsername(inBackground: userNameText.text!, password: passwordText.text!) { user, error in
                if error != nil{
                    self.makeAlert(titleInput: "Error", messageText: error?.localizedDescription ?? "Error")
                }else{
                    //Segue
                    print("Hoşgeldin")
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }else{
            makeAlert(titleInput: "Error", messageText: "Username / Password??")
        }
    }
    
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if userNameText.text != "" && passwordText.text != ""{
            
            let user = PFUser()
            user.username = userNameText.text!
            user.password = passwordText.text!
            user.signUpInBackground { success, error in
                if error != nil{
                    self.makeAlert(titleInput: "Error", messageText: error?.localizedDescription ?? "Error")
                }else{
                    //Segue
                    print("OK!")
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        }else{
            makeAlert(titleInput: "Error", messageText: "Username / Password??")
        }
    }
    
    func makeAlert(titleInput: String,messageText:String){
        let alert = UIAlertController(title: titleInput, message: messageText, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert,animated: true,completion: nil)
    }
}

