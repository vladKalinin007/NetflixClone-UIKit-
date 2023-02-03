//
//  Extensions.swift
//  Netflix
//
//  Created by Владислав Калинин on 28.11.2022.
//

import Foundation

// MARK: String extension for first letter
extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
