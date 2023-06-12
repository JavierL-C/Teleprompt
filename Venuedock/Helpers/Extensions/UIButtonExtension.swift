//
//  UIButtonExtension.swift
//  Poker Tutorials and Practice Exercises
//
//  Created by Mac on 07/06/2023.
//

import UIKit

extension UIButton {
    func makeCircularWithLargeTitle() {
        self.layer.cornerRadius = self.bounds.height / 2
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = 0.5
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.textAlignment = .center
        self.backgroundColor = .yellow
        self.tintColor = .black
    }
}
