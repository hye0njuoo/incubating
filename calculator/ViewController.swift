//
//  ViewController.swift
//  calculator
//
//  Created by 성현주 on 2023/05/15.
//

import UIKit
import SnapKit


//버튼
class ViewController: UIViewController {
    lazy var plusButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.setTitle("더하기", for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(plusButtonDidtap), for: .touchUpInside)
        return button
    }()
    @objc func plusButtonDidtap(){
        if let num1 = firstTextField.text,
           let num2 = secondTextField.text{
            if let a = Int(num1),
               let b = Int(num2){
                display.text = "\(a) + \(b) = \(a+b)"
            }else{
                display.text = "숫자만 입력해주세요."
                display.textColor = .black
            }
        }
    }
    
    lazy var minButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.setTitle("뺴기", for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(minusButtonDidtap), for: .touchUpInside)
        return button
    }()
    @objc func minusButtonDidtap(){
        if let num1 = firstTextField.text,
           let num2 = secondTextField.text{
            if let a = Int(num1),let b = Int(num2){
                display.text = "\(a) - \(b) = \(a-b)"
            }else{
                display.text = "숫자만 입력해주세요."
                display.textColor = .black
            }
        }
    }
    
    lazy var mulButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.setTitle("곱하기", for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(mulButtonDidtap), for: .touchUpInside)
        return button
    }()
    @objc func mulButtonDidtap(){
        if let num1 = firstTextField.text,
           let num2 = secondTextField.text{
            if let a = Int(num1),let b = Int(num2){
                display.text = "\(a) X \(b) = \(a*b)"
            }else{
                display.text = "숫자만 입력해주세요."
                display.textColor = .black
            }
        }
    }
    
    lazy var divButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.setTitle("나누기", for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(divButtonDidtap), for: .touchUpInside)
        return button
    }()
    enum ErrorMessage: String, Error{
        case DivZero = "0으로 나눌수 없습니다."
    }
    @objc func divButtonDidtap()throws{
        do{
            guard let num1 = firstTextField.text,let num2 = secondTextField.text else{
                return
            }
            guard let a =  Int(num1),let b = Int(num2) else{
                return
            }
            
            if b != 0{
                display.text = "\(a) / \(b) = \(a/b)"}else{
                    throw ErrorMessage.DivZero
                }
        }
        catch ErrorMessage.DivZero{
            display.text = ErrorMessage.DivZero.rawValue
            display.textColor = .gray
            
        }
    }
    
    
    //텍스트 필드
    lazy var firstTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "첫번째 숫자를 입력해주세요."
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 20
        textField.addTarget(self, action: #selector(live1), for: UIControl.Event.editingChanged)
        return textField
    }()
    @objc func live1(){
        display.text = "숫자를 모두 입력해주세요."
        display.textColor = .gray
    }
    
    lazy var secondTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "두번째 숫자를 입력해주세요."
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 20
        textField.addTarget(self, action: #selector(live2), for: UIControl.Event.editingChanged)
        return textField
    }()
    @objc func live2(){
        display.text = "버튼을 눌러주세요!"
        display.textColor = .black
    }
    
    //라벨
    lazy var display: UILabel = {
        let label = UILabel()
        label.text = "값을 입력해주세요."
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //self.view.addSubview(self.plusButton)
        //self.view.addSubview(self.minButton)
        //self.view.addSubview(self.mulButton)
        //self.view.addSubview(self.divButton)
        //self.view.addSubview(self.firstTextField)
        //self.view.addSubview(self.secondTextField)
        //self.view.addSubview(self.display)
       
        //foreach문을 활용한 방법1
//        [plusButton, minButton, mulButton, divButton, firstTextField, secondTextField, display].forEach{
//            view.addSubview($0)
//        }
        
        //extension 을  활용한 방법 2
        view.addSubviews(
            plusButton, minButton, mulButton, divButton, firstTextField, secondTextField, display
        )
        
        
        
        
        
        //레이아웃
        plusButton.snp.makeConstraints{ (make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalToSuperview().offset(320)
        }
        minButton.snp.makeConstraints{ (make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalTo(plusButton.snp.bottom).offset(10)
        }
        mulButton.snp.makeConstraints{ (make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalTo(minButton.snp.bottom).offset(10)
        }
        divButton.snp.makeConstraints{ (make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalTo(mulButton.snp.bottom).offset(10)
        }
        firstTextField.snp.makeConstraints{(make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalTo(157)
        }
        secondTextField.snp.makeConstraints{(make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalTo(firstTextField.snp.bottom).offset(10)
        }
        display.snp.makeConstraints{(make) in
            make.width.equalTo(200)
            make.height.equalTo(22)
            make.centerX.equalToSuperview()
            make.top.equalTo(secondTextField.snp.bottom).offset(20)
        }




    }

}



