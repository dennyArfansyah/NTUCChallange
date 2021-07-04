//
//  CourseViewCell.swift
//  NTUCChallange
//
//  Created by Denny Arfansyah on 04/07/21.
//

import LBTAComponents

class CourseCellView: UITableViewCell {
    
    let titleLabel = UILabel()
    let desciptionLabel = UILabel()
    let dateLabel = UILabel()
    let roundedView = UIView()
    let verticalLine = UIView()
    let diamondImage = UIImageView()
    
    static let reusedIdenfier = "CourseCellView"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.addSubview(verticalLine)
        verticalLine.anchor(contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil,
                            topConstant: 0, leftConstant: 45, bottomConstant: 0, rightConstant: 0, widthConstant: 1, heightConstant: 0)
        verticalLine.backgroundColor = .gray
        
        contentView.addSubview(diamondImage)
        diamondImage.image = UIImage(systemName: "diamond.fill")
        diamondImage.anchor(nil, left: contentView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 40,
                            bottomConstant: 0, rightConstant: 0, widthConstant: 10, heightConstant: 10)
        diamondImage.anchorCenterYToSuperview()
        
        contentView.addSubview(roundedView)
        roundedView.anchor(contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor,
                           topConstant: 10, leftConstant: 60, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        roundedView.backgroundColor = UIColor(red: 249/255, green: 235/255, blue: 223/255, alpha: 1.0)
        roundedView.layer.cornerRadius = 10
        
        roundedView.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.anchor(roundedView.topAnchor, left: roundedView.leftAnchor, bottom: nil, right: roundedView.rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)

        roundedView.addSubview(desciptionLabel)
        desciptionLabel.numberOfLines = 0
        desciptionLabel.font = UIFont.boldSystemFont(ofSize: 13)
        desciptionLabel.anchor(titleLabel.bottomAnchor, left: roundedView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        roundedView.addSubview(dateLabel)
        dateLabel.numberOfLines = 0
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        dateLabel.textColor = .gray
        dateLabel.anchor(desciptionLabel.bottomAnchor, left: roundedView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(with course: Course) {
        titleLabel.setUnderline(text: course.title, color: .black)
        desciptionLabel.text = course.description
        dateLabel.text = "Awarded on \(course.date)"
    }
    
}
