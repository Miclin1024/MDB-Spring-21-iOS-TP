//
//  TitleSupplementaryView.swift
//  SFSymbolCollection
//
//  Created by Michael Lin on 3/15/21.
//

import UIKit

class TitleSupplementaryView: UICollectionReusableView {
    static let reuseIdentifier = String(describing: TitleSupplementaryView.self)
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init?(coder:) is not implemented")
    }
}

extension TitleSupplementaryView {
    func configure() {
        addSubview(label)
        label.frame = bounds.inset(by: UIEdgeInsets(top: 3, left: 10, bottom: 3, right: 5))
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title2)
    }
}
