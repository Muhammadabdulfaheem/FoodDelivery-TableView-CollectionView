//
//  LoginController.swift
//  FoodDeliveryApp
//
//  Created by MAC on 23/06/2021.
//

import UIKit
import Alamofire
class LoginController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    let baseURL = "https://reqres.in/api/login"
    var passwordIcon = false // for password icon
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        self.setupView()
    }
    func setupView(){
        let emailImg = UIImage(systemName:"pencil")
        addImagesIcon(textField: email, img: emailImg!)
        let passwordImg = UIImage(systemName: "pencil")
        addImagesIcon(textField: password, img: passwordImg!)
        
    }
   
    func addImagesIcon(textField: UITextField,img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x:0.0, y: 0.0, width: img.size.width,height: img.size.height))
        leftImageView.image = img
        textField.leftView = leftImageView
        textField.leftViewMode = .always
        /*
        let rightImageView = UIImageView(frame: CGRect(x:0.0, y:0.0,width: img.size.width,height: img.size.height))
        rightImageView.image = img
        textField.rightView = rightImageView
        textField.rightViewMode = .always
         */
    }
    
   
    // when user click on eye icons and show password
    @IBAction func showPassword(_ sender: UIButton) {
        if passwordIcon{
            password.isSecureTextEntry = false
        }
        else{
            password.isSecureTextEntry = true
        }
        passwordIcon = !passwordIcon /* if icon contain false first time it shows the password and this  and this line
         contain password again contain ture so when user click on it it hide password*/
    }
    
    
    func showAlert(_ title:String = "Error", message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
        
    }
    func loginsController(){
        if self.password.text?.isEmpty == true && self.email.text?.isEmpty == true{
            self.showAlert(message: "Fields are empty")
        }
        else{
        guard let email = self.email.text,
              email.isEmpty == false else {//measn empty nhi else empty he
        self.showAlert(message: "Email is empty")
        return
        }
        guard let password = self.password.text,
              password.isEmpty == false else{
            self.showAlert(message: "Password is empty")
            return
        }
            self.login(url: self.baseURL, email: email, password: password)
        }
    }
    func login(url:String,email:String,password:String){
        let params:Parameters = [
            "email":email,
            "password":password
        ]
        AF.request(url,method: .post,parameters: params, encoding: URLEncoding.default,headers: nil).response {
            (responseData) in
            //print("We got to response")
            guard  let data = responseData.data else {
                return
            }
            do{
                let countries = try JSONDecoder().decode([String].self, from: data)
                print("countires are \(countries)")
            }
            catch{
                print("error")
            }

        }
    }
   
    @IBAction func loginBtn(_ sender: UIButton) {
        loginsController()
       
    }
    
    @IBAction func createNewAccount(_ sender: UIButton) {
        guard let newAccountController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: SignupController.self)) as? SignupController else {return}
        self.navigationController?.pushViewController(newAccountController, animated: true)
    }
}
