//
//  ProfileVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 22/07/23.
//

import UIKit

class ProfileVC: UIViewController {
    
    //MARK: Variables
    var topView      = UIView()
    var userImg      = UIImageView()
    var firstNameTF  = UITextField()
    var secondNameTF = UITextField()
    var saveBtn      = UIButton()
    var userDef      = UserDefaults.standard
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getUserInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.backgroundColor = .primaryAppColor
    }
    
    //MARK: savePressed
    @objc func savePressed(_ sender: Any){

        if secondNameTF.text!.isEmpty {
            userDef.set("", forKey: Constants.firstNameTfForProfile)
        } else {
            userDef.set(secondNameTF.text ?? "", forKey: Constants.firstNameTfForProfile)
        }
        
        if firstNameTF.text!.isEmpty {
            userDef.set("", forKey: Constants.secondNameTfForProfile)
        } else {
            userDef.set(firstNameTF.text ?? "", forKey: Constants.secondNameTfForProfile)
        }
        
        let userImage = userImg.image?.toPngString()
        userDef.set(userImage, forKey: Constants.userImageForProfile)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: selectPhoto
    @objc func selectPhoto(_ sender: UITapGestureRecognizer){
        let vc = UIImagePickerController()
        vc.allowsEditing = true
        vc.delegate = self
        vc.sourceType = .photoLibrary
        present(vc, animated: true)
    }
    
    //MARK: doneTF
    @objc func nextTF(_ sender: Any){
        secondNameTF.resignFirstResponder()
        firstNameTF.becomeFirstResponder()
    }
    
    @objc func doneTF(_ sender: Any){
        firstNameTF.resignFirstResponder()
    }
    
    //MARK: getUserInfo
    func getUserInfo(){
        secondNameTF.text = userDef.string(forKey: Constants.firstNameTfForProfile) ?? ""
        firstNameTF.text = userDef.string(forKey: Constants.secondNameTfForProfile) ?? ""
        let img = userDef.string(forKey: Constants.userImageForProfile)
        
        if let image = img, let userImage = image.toImage()  {
            userImg.image = userImage
        } else {
            userImg.image = UIImage(named: "add_user_image")
        }
    }
    
}

//MARK: UIImagePickerControllerDelegate
extension ProfileVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        if image == nil {
            print("nil")
        } else {
            userImg.image = image
            userImg.layer.cornerRadius = 50
        }
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
