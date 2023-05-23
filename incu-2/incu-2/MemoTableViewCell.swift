//
//  MemoCell.swift
//  incu-2
//
//  Created by 성현주 on 2023/05/21.
//

import UIKit


class MemoTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("오류발생")
    }
}
