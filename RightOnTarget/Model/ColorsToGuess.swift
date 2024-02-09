//
//  ColorsToGuess.swift
//  RightOnTarget
//
//  Created by Andrei Shpartou on 09/02/2024.
//

import UIKit

protocol ColorsToGuessProtocol {
    var arrayOfColors: [UIColor] { get }
    var countOfColors: Int { get }
    mutating func generateRandomColors() -> [UIColor]
    func getColor() -> UIColor
}

struct ColorsToGuess: ColorsToGuessProtocol {
    internal var arrayOfColors: [UIColor]
    internal var countOfColors: Int
    
    init(countOfColors: Int) {
        self.arrayOfColors = []
        self.countOfColors = countOfColors
    }
    
    mutating func generateRandomColors() -> [UIColor] {
        arrayOfColors = []
        while arrayOfColors.count < countOfColors {
            let newRandomColor = getColor()
            if !arrayOfColors.contains(newRandomColor) {
                arrayOfColors.append(newRandomColor)
            }
        }
        return arrayOfColors
    }
    
    func getColor() -> UIColor {
        let randomColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0)
        
        return randomColor
    }
    
}
