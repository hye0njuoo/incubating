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
        setUI()
        updateUI()
    }
    
    private func updateUI() {
        guard let memo = memo, let contant = contant else {
            return
        }
        
        titleLabel.text = memo.memotitle
        contentLabel.text = contant.memocontant
    }
    private func setUI(){
        setViewHierachy()
        setConstraints()
    }
    private func setViewHierachy(){
        self.navigationItem.title = "메모상세"
        view.backgroundColor = .white
        [titleLabel,contentLabel].forEach {
            view.addSubview($0)
        }
    }
    private func setConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(137)
            make.leading.equalToSuperview().offset(36)
        }
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(36)
            
        }
    }
}
