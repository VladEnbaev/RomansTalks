//
//  UIViewController + ext.swift
//  RomansTalks
//
//  Created by Влад Енбаев on 31.05.2023.
//

import Foundation
import UIKit
import SwiftUI

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
    func showPreview() -> some View {
        Preview (viewController: self).edgesIgnoringSafeArea(.all)
    }
}
