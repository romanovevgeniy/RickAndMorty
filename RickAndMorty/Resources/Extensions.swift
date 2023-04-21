//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Евгений Романов on 21.04.2023.
//

import UIKit

extension UIView {
    func addSubViews(_ view: UIView...) {
        view.forEach ({
            addSubview($0)
        })
    }
}
