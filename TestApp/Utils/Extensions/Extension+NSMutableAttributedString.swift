//
//  Extension+NSMutableAttributedString.swift
//  TestApp
//
//  Created by Can Akyıldız on 6.11.2021.
//

import UIKit

extension NSMutableAttributedString {
    func underline(_ textToFind: String) {
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(NSAttributedString.Key.underlineStyle,
                              value: NSUnderlineStyle.single.rawValue,
                              range: foundRange)
        }
    }
}
