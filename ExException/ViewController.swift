//
//  ViewController.swift
//  ExException
//
//  Created by 김종권 on 2023/12/15.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackViewColor = getStackViewColor(parentView: view)
        
    do {
        let stackViewColor = try getStackViewColorNew(parentView: view)
    } catch {
        switch error as? ViewStateError {
        case .nonExisted:
            print("nonExisted")
        case .nonColor:
            print("nonColor")
        case .none:
            print("none")
        }
    }
    }
}


func getStackViewColor(parentView: UIView) -> UIColor? {
    let targetView = parentView
        .subviews
        .first { $0 is UIStackView }
    
    return targetView?.backgroundColor
}

enum ViewStateError: Error {
    case nonExisted
    case nonColor
}

func getStackViewColorNew(parentView: UIView) throws -> UIColor {
    let targetView = parentView
        .subviews
        .first { $0 is UIStackView }
    
    guard let targetView else { throw ViewStateError.nonExisted }
    guard let color = targetView.backgroundColor else { throw ViewStateError.nonColor }
    return color
}
