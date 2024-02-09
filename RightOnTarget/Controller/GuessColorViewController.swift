//
//  GuessColorViewController.swift
//  RightOnTarget
//
//  Created by Andrei Shpartou on 09/02/2024.
//

import UIKit

class GuessColorViewController: UIViewController {

    @IBOutlet weak var hexValueOfColor: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    var colorsToGuess: ColorsToGuessProtocol!
    var game: GameProtocol!
    var arrayOfButtonOutlets: [UIButton] = []
    var arrayOfColors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomizer = Randomizer(min: 0, max: 3)!
        game = Game(randomizer: randomizer, rounds: 5)

        colorsToGuess = ColorsToGuess(countOfColors: 4)
        arrayOfButtonOutlets.append(option1)
        arrayOfButtonOutlets.append(option2)
        arrayOfButtonOutlets.append(option3)
        arrayOfButtonOutlets.append(option4)
        updateButtonsWithColors()
    }
    
    func updateButtonsWithColors() {
        arrayOfColors = colorsToGuess.generateRandomColors()
        for (index, color) in arrayOfColors.enumerated() {
            let outlet = arrayOfButtonOutlets[index]
            outlet.backgroundColor = color
            outlet.setTitle(color.accessibilityName, for: .normal)
            
        }
        updateLabelTextWithHexColor()
    }
    
    func updateLabelTextWithHexColor() {
        hexValueOfColor.text = arrayOfColors[game.currentGameRound.currentSecretValue].toHex()
    }
    
    @IBAction func optionHasChosen(_ sender: UIButton) {
        let chosenOptionValue = arrayOfButtonOutlets.firstIndex(of: sender)!
        game.currentGameRound.calculateScore(with: chosenOptionValue, gameOption: .Colors)
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateButtonsWithColors()
    }
    
    func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Game over", message: "Your score is \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Start new game?", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
