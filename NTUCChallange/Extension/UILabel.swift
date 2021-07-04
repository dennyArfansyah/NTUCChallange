//
//  UILabel.swift
//  NTUCChallange
//
//  Created by Denny Arfansyah on 04/07/21.
//

import UIKit

extension UILabel {
    
    func setUnderline(text: String, color: UIColor) {
        let textColor: UIColor = color
            let underLineColor: UIColor = color
            let underLineStyle = NSUnderlineStyle.single.rawValue
            let labelAtributes:[NSAttributedString.Key : Any]  = [
                NSAttributedString.Key.foregroundColor: textColor,
                NSAttributedString.Key.underlineStyle: underLineStyle,
                NSAttributedString.Key.underlineColor: underLineColor
            ]
        self.attributedText = NSAttributedString(string: text, attributes: labelAtributes)
    }
    
}
