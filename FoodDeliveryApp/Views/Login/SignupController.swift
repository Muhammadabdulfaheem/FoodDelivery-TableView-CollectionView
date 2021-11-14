//
//  SignupController.swift
//  FoodDeliveryApp
//
//  Created by MAC on 23/06/2021.
//

import UIKit

class SignupController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var showAlertButton : UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nameImg = UIImage(systemName: "pencil")
        let emailImg = UIImage(systemName: "pencil")
        let passwordImg = UIImage(systemName: "pencil")
        let cPasswordImg = UIImage(systemName: "pencil")
        addImageIcons(textField: name, img: nameImg!)
        addImageIcons(textField: email, img: emailImg!)
        addImageIcons(textField: password, img: passwordImg!)
        addImageIcons(textField: confirmPassword, img: cPasswordImg!)
        password.isSecureTextEntry = true
        confirmPassword.isSecureTextEntry = true
        
        
        // Do any additional setup after loading the view.
    }
    
    func addImageIcons(textField:UITextField,img:UIImage){
        
        let leftImageView = UIImageView(frame: CGRect(x:0.0, y:0.0,width: img.size.width,height: img.size.height))
        leftImageView.image = img
        textField.leftView = leftImageView
        textField.leftViewMode = .always
        
        
    }
    @IBAction func signup(_ sender: UIButton) {
        validationSignupFields()

    }

    @IBAction func selectImage(_ sender: UIButton) {
     showAlert()
        //when choosing camera its not working because we used simulator

    }
    private func showAlert(_ title:String = "Error",message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func validationSignupFields(){
        if self.name.text?.isEmpty == true &&
              self.email.text?.isEmpty == true &&
              self.password.text?.isEmpty == true &&
            self.confirmPassword.text?.isEmpty == true{
            showAlert(message: "All fields are empty")
            return
        }
        else {
            guard let name = self.name.text,
                  name.isEmpty == false else {//means names is not empty
                self.showAlert(message: "Name is emptry")
                return
            }
            guard let email = self.email.text,
                  email.isEmpty == false else {
                self.showAlert(message: "Email is emptry")
                return
            }
            guard let password = self.password.text,
                  password.isEmpty == false else {
                self.showAlert(message: "Password is emptry")
                return
            }
            guard let confirmPass = self.confirmPassword.text,
                  confirmPass.isEmpty == false else {
                self.showAlert(message: "Confirm Password is emptry")
                return
            }
            guard password == confirmPass else {
                self.showAlert(message: "Password and Confirm password are mismatched")
                return
            }
            guard let loginController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: LoginController.self)) as? LoginController else {return}
            self.navigationController?.pushViewController(loginController, animated: true)
        }
        
    }
  
    func showAlert(){
        
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertController.Style.alert)
              let cameraAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default) {
                  UIAlertAction in
                  self.openCamera(UIImagePickerController.SourceType.camera)
              }
              let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertAction.Style.default) {
                  UIAlertAction in
                  self.openCamera(UIImagePickerController.SourceType.photoLibrary)
              }
              let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
                  UIAlertAction in
              }
              imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
              alert.addAction(cameraAction)
              alert.addAction(gallaryAction)
              alert.addAction(cancelAction)
              self.present(alert, animated: true, completion: nil)
    }
    func openCamera(_ sourceType: UIImagePickerController.SourceType) {
        imagePicker.sourceType = sourceType
        self.present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imagePicker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("imagePickerController cancel")
    }

}
