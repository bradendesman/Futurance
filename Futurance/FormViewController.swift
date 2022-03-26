//
//  FormViewController.swift
//  Futurance
//
//  Created by Braden Desman on 3/26/22.
//

import UIKit
import Firebase
class FormViewController: UIViewController, UITextFieldDelegate {
    
    var pageNumber: Int = 0
    @IBOutlet var continueButton: UIButton!
    
    //MARK: Page 0 Outlets
    @IBOutlet var pageOneStack: UIStackView! //outlets lets you view text fields
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var retypePasswordTextField: UITextField!
    
    //MARK: Page 1 Outlets
    @IBOutlet var pageTwoStack: UIStackView!
    @IBOutlet var pageTwoChoices: [UIStackView]!
    
    
    
    var fields: [UIControl]!
    var pages: [UIStackView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFields()
        
        
    }
    
    
    //MARK: Page 0 Logic
    @IBAction func firstNameTextFieldChangd(_ sender: Any) { //functions run when field is triggered
        updateContinueButton()
    }
    @IBAction func lastNameTextFieldChanged(_ sender: Any) {
        updateContinueButton()
    }
    @IBAction func ageTextFieldChanged(_ sender: Any) {
        updateContinueButton()
    }
    @IBAction func emailTextFieldChanged(_ sender: Any) {
        updateContinueButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: Page 1 Logic
    @IBAction func workStatusButtonPressed(_ sender: UIButton) {
        let stack = sender.superview as! UIStackView
        stack.arrangedSubviews[0].isHidden.toggle()
    }
    
    
    
    //MARK: Update Button Logic
    
    @IBAction func presentNextQuestions(_ sender: Any) {
        createAccount(email, password)
        if pageNumber == (pages.count - 1) {
            print("end")
        }
        else {
            pages[pageNumber].isHidden = true
            pageNumber += 1
            pages[pageNumber].isHidden = false
        }
        
    }
    
    func configureFields() {
        pages = [pageOneStack, pageTwoStack]
        fields = [firstNameTextField, lastNameTextField,ageTextField,emailTextField]
        
        for field in fields {
            guard let currentField = field as? UITextField else {return}
            currentField.delegate = self
            currentField.autocapitalizationType = .words
        }
        for page in pages {
            if page != pageOneStack {
                page.isHidden = true
            }
        }
        
        
        for i in 0...pageTwoChoices.count-1 {
            pageTwoChoices[i].arrangedSubviews[0].isHidden = true
        }
        continueButton.isEnabled = false
    }
    func updateContinueButton() {
        if pageNumber == 0 {
            guard let firstName = firstNameTextField.text else {return}
            guard let lastName = lastNameTextField.text else {return}
            guard let age = ageTextField.text else {return}
            guard let email = emailTextField.text else {return}
            guard !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !age.isEmpty else {return}
            
            guard let ageNumber = Int(age), ageNumber > 0 else {return}
            guard let password = passwordTextField.text
                else {return}
            guard let retypePassword = retypePasswordTextField.text
                else {return}
            let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' "
            
            for char in firstName {
                if !allowedChars.contains(char) {return}
            }
            for char in lastName {
                if !allowedChars.contains(char) {return}
            }
            for char in email {
                if "@.".contains(char) {
                    continue
                }
                if !allowedChars.contains(char) {return}
            }
            
            guard password.isEmpty == false else {return} //if the statement is true, code will continue, if the guard is false it will execute return.
            guard password == retypePassword else {return}
            continueButton.isEnabled = true
        }
        
    }
    func createAccount(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
        }
    }
}
