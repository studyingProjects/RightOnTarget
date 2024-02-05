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
    
    // загаданное число
    var number: Int = 0
    // раунд
    var round: Int = 0
    // сумма очков за раунд
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkNumber() {
        if self.round == 0 {
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
            self.round = 1
        } else {
            let sliderValue = Int(self.slider.value.rounded())
            if self.number > sliderValue {
                self.points = self.points + 50 - self.number + sliderValue
            } else if self.number < sliderValue {
                self.points = self.points + 50 - sliderValue + self.number
            } else {
                self.points += 50
            }
            
            self.round += 1
            
            if round == 6 {
                label.text = "You earn \(self.points) points!"
                
                let alert = UIAlertController(
                    title: "Game over",
                    message: "You earn \(self.points) points",
                    preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Play again!", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                self.points = 0
                self.round = 0
                return
            }
            
            self.number = Int.random(in: 1...50)
            label.text = String(self.number)
            
        }
    
    }


}

