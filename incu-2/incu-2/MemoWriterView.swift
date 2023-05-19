import UIKit
import SnapKit

protocol AddmemoTitleDelegate {
    func addMemo(memo: Memo)
}
protocol AddmemoContantDelgate {
    func addContant(contant: Contant)
}

class MemoWriterView : UIViewController{
    
    var delegate: AddmemoTitleDelegate?
    var delegate2: AddmemoContantDelgate?
    
    lazy var label: UITextField = {
        let label = UITextField()
        label.placeholder = "제목을 작성해주세요"
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: label.frame.height))
        label.leftView = padding
        label.leftViewMode = .always
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 0.5
        return label
    }()
    private lazy var textview: UITextView = {
        let textview = UITextView()
        textview.backgroundColor = .systemGray6
        textview.layer.cornerRadius = 10
        textview.font = .systemFont(ofSize: 15.0)
        textview.text = "내용을 입력해주세요"
        textview.textColor = .placeholderText
        textview.delegate = self
        return textview
    }()
//    lazy var label2: UILabel = {
//       let countLabel = UILabel()
//       countLabel.text = "0/100"
//       return label2
//    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "메모작성"
        self.navigationItem.backButtonTitle = "메모목록"
        self.view.addSubview(self.label)
        view.addSubview(textview)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidtap))
       // self.view.addSubview(self.label2)

        
        
        //layout
        label.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(26)
            make.top.equalToSuperview().offset(123)
            make.height.equalTo(35)
        }
        textview.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(26)
            make.top.equalTo(label.snp.bottom).offset(20)
            make.height.equalTo(600)
        }
//        label2.snp.makeConstraints { (make) in
//            make.leading.trailing.equalToSuperview().inset(26)
//            make.top.equalTo(textview.snp.bottom).offset(10)
//        }
        
    }
    @objc func doneButtonDidtap() {
        
        self.navigationController?.popToRootViewController(animated: true)
        
        guard let memotitle = label.text, label.hasText else{
            print("오류")
            return
        }
        guard let memocontant = textview.text, textview.hasText else{
            print("오류")
            return
        }
        
        let memo = Memo(memotitle: memotitle)
        delegate?.addMemo(memo: memo)
        
        let contant = Contant(memocontant: memocontant)
        delegate2?.addContant(contant: contant)
        
    }
    //countLabel.text = "0/100"

//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        let currentText = textView.text ?? ""
//        guard let stringRange = Range(range, in: currentText) else { return false }
//
//        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
//        label2.text = "\(changedText.count)/100"
//
//        return true
//
//    }
    
}



//placeholder 만들기
extension MemoWriterView: UITextViewDelegate{
    
    
    func textViewDidChange(_ textView: UITextView) {
        guard textView.textColor == .placeholderText else {return}
        textView.textColor = .label
        textView.text = nil
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = "내용을 입력해주세요"
            textView.textColor = .placeholderText
        }
    }
}












