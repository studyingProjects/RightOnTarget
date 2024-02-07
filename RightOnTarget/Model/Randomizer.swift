//
//  Randomizer.swift
//  RightOnTarget
//
//  Created by Andrei Shpartou on 07/02/2024.
//

import Foundation

protocol RandomizerProtocol {
    func getRandomValue() -> Int
}

struct Randomizer: RandomizerProtocol {
    
    private let min: Int
    private let max: Int
    
    init?(min: Int, max: Int) {
        // Стартовое значение для выбора случайного числа не может быть больше конечного
        guard min <= max else {
            return nil
        }
        self.min = min
        self.max = max
    }
    
    func getRandomValue() -> Int {
        return (min...max).randomElement()!
    }
}
