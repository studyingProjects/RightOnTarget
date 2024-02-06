//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Andrei Shpartou on 29/01/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var gameModel: Game!

    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameModel = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelText(with: String(gameModel.currentSecretValue))
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewDidDisappear")
    }
    // MARK: - View - Model interaction
    @IBAction func checkNumber() {
        let currentUserValue = Int(slider.value.rounded())
        gameModel.calculateScore(with: currentUserValue)
        if gameModel.isGameEnded {
            showAlertWith(score: gameModel.score)
            gameModel.restartGame()
        } else {
            gameModel.startNewRound()
        }
        updateLabelText(with: String(gameModel.currentSecretValue))
    }
    // MARK: - View updating
    func updateLabelText(with newText: String) {
        label.text = newText
    }
    
    func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Game over", message: "Your score is \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "restart game", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

