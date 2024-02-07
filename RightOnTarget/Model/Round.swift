//
//  Round.swift
//  RightOnTarget
//
//  Created by Andrei Shpartou on 07/02/2024.
//

import Foundation

protocol RoundProtocol {
    // Загаданное значение
    var currentSecretValue: Int { get }
    var score: Int { get }
    // Сравнивает переданное значение с загаданным и начисляет очки
    func calculateScore(with value: Int)
}

class Round: RoundProtocol {
    
    var score: Int = 0
    var currentSecretValue: Int = 0
    
    init(currentSecretValue: Int) {
        self.currentSecretValue = currentSecretValue
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score = 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score = 50 - currentSecretValue + value
        } else {
            score = 50
        }
    }
    
}
