import UIKit

class DetailViewController: UIViewController {
    
    var memo: Memo?
    var contant: Contant?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        //label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "메모상세"
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(137)
            make.leading.equalToSuperview().offset(36)
        }
        view.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(36)
            //make.trailing.equalToSuperview().inset(295)
        }
        
        updateUI()
    }
    
    private func updateUI() {
        guard let memo = memo, let contant = contant else {
            return
        }
        
        titleLabel.text = memo.memotitle
        contentLabel.text = contant.memocontant
    }
}
