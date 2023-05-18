//
//  UIStackView+setup.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 25.03.2023.
//

import Foundation
import UIKit

extension UIStackView {
    func setupVertical(spacing: CGFloat, distribution: UIStackView.Distribution) {
        self.axis = .vertical
        self.distribution = distribution
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
