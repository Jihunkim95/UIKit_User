//
//  ViewController.swift
//  User
//
//  Created by 김지훈 on 2023/12/27.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    var viewModel = UserViewModel()
    let disposeBag = DisposeBag()
    
    let usernameTextField = UITextField()
    let validationLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // UI 설정
        setupUI()
        
        // ViewModel 바인딩
        usernameTextField.rx.text.orEmpty
            .bind(to: viewModel.username)
            .disposed(by: disposeBag)
        
        viewModel.isValidUsername
            .bind(to: validationLabel.rx.isHidden)
            .disposed(by: disposeBag)
    }
    
    
    func setupUI() {
        
        // usernameTextField 설정
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.placeholder = "Enter username"

        // validationLabel 설정
        validationLabel.text = "Invalid Username"
        validationLabel.textColor = .red
        validationLabel.isHidden = true

        // 뷰에 요소 추가
        view.addSubview(usernameTextField)
        view.addSubview(validationLabel)

        // Auto Layout 설정
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        validationLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // usernameTextField 레이아웃
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // validationLabel 레이아웃
            validationLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 8),
            validationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            validationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
     }


}

