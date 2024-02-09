//
//  Game.swift
//  RightOnTarget
//
//  Created by Andrei Shpartou on 06/02/2024.
//

import Foundation

protocol GameProtocol {
    // Количество заработанных очков
    var score: Int { get }
    var secretValueGenerator: RandomizerProtocol { get }
    var currentGameRound: RoundProtocol { get }
    // Проверяет, закончена ли игра
    var isGameEnded: Bool { get }
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // Начинает новый раунд (обновляет загаданное число)
    func startNewRound()
}

enum GameOption {
    case Slider
    case Colors
}

class Game: GameProtocol {
    var secretValueGenerator: RandomizerProtocol
    var currentGameRound: RoundProtocol
    private var rounds: [RoundProtocol] = []
    private var totalRounds: Int = 0
    var isGameEnded: Bool {
        if totalRounds == rounds.count {
            return true
        } else {
            return false
        }
    }
    var score: Int {
        var totalScore: Int = 0
        for round in rounds {
            totalScore += round.score
        }
        return totalScore
    }
    
    init(randomizer: RandomizerProtocol, rounds: Int) {
        secretValueGenerator = randomizer
        totalRounds = rounds
        currentGameRound = Round(currentSecretValue: secretValueGenerator.getRandomValue())
        self.rounds.append(currentGameRound)
    }
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    func startNewRound() {
        let newSecretValue = secretValueGenerator.getRandomValue()
        currentGameRound = Round(currentSecretValue: newSecretValue)
        rounds.append(currentGameRound)
    }

}
