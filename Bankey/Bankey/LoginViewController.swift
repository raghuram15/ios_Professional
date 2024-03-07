//
//  ViewController.swift
//  Bankey
//
//  Created by Raghuram on 06/03/24.
//

import UIKit

class LoginViewController: UIViewController {

    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let titleLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layout()
        if #available(iOS 15.0, *) {
            styley()
        } else {
            // Fallback on earlier versions
        }
    }


}


extension LoginViewController {
    @available(iOS 15.0, *)
    private func styley(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey"
        titleLabel.textColor = .black
        loginView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8  //for indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
         errorMessageLabel.isHidden = true
    }
    
   
    private func layout() {
       // view.addSubview(titleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
//        NSLayoutConstraint.activate([
//            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            titleLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor)
//        ])
        
        //Login
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            loginView.centerYAnchor.constraint(equalTo:view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            // it shd be diff when it comes to trailing
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
          //  loginView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 1)
        ])
        
        // signInButton
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        
        ])
        
        // Error Label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}
// MARK: Actions
@available(iOS 15.0, *)
extension LoginViewController {
    
    @objc func signInTapped(sender: UIButton){
        print("tapped")
        errorMessageLabel.isHidden = true
        login()
    }
    
    @available(iOS 15.0, *)
    func login(){
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    
    private func configureView(withMessage message: String) {
        
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
