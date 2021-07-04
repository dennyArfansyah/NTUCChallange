//
//  CollectionViewCell.swift
//  NTUCChallange
//
//  Created by Denny Arfansyah on 04/07/21.
//

import LBTAComponents

class CollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    static let reusedIdentifier = "CollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        contentView.addSubview(imageView)
        contentView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.anchor(contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}
