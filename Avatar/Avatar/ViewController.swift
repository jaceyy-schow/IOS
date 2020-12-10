//
//  ViewController.swift
//  Avatar
//
//  Created by Owner on 9/16/20.
//  Copyright © 2020 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet  var nameLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let names: [String] = [
    "Aang",
    "Zuko",
    "Katara",
    "Toph",
    "Sokka",
    "Azula",
    "Iroh",
    "Hakoda",
    "Korra",
    "Mako",
    "Bolin",
    "Tenzin"
    ]
    
    let nation: [String] = [
    "Air",
    "Fire",
    "Water",
    "Earth",
    "Water",
    "Fire",
    "Fire",
    "Water",
    "Water",
    "Fire",
    "Earth",
    "Air"
    ]
    
    var currentNameIndex: Int = 0
    
    var playerAnswer: String = " "
    

    @IBAction func showNextQuestion(_ sender: UIButton){
        currentNameIndex += 1
        print("hey")
        if currentNameIndex == names.count {
            currentNameIndex = 0
        }
        
        let name: String = names[currentNameIndex]
        nameLabel.text = name
        answerLabel.text =  " "
        answerLabel.backgroundColor = #colorLiteral(red: 0.9201951101, green: 0.8659230929, blue: 0.7443945736, alpha: 1)

    }
    
    @IBAction func airClicked(_ sender: UIButton){
        playerAnswer = "Air"
        print("Air")
        if nation[currentNameIndex] == playerAnswer{
            answerLabel.text = "Correct"
            answerLabel.backgroundColor = #colorLiteral(red: 0.5169595388, green: 0.9201951101, blue: 0.3829920078, alpha: 1)
        } else{
            answerLabel.text = "Incorrect"
            answerLabel.backgroundColor = #colorLiteral(red: 0.9201951101, green: 0.2655968123, blue: 0.311134614, alpha: 1)
        }
    }
    
    @IBAction func fireClicked(_ sender: UIButton){
        playerAnswer = "Fire"
        if nation[currentNameIndex] == playerAnswer{
            answerLabel.text = "Correct"
            answerLabel.backgroundColor = #colorLiteral(red: 0.5169595388, green: 0.9201951101, blue: 0.3829920078, alpha: 1)
        } else{
            answerLabel.text = "Incorrect"
            answerLabel.backgroundColor = #colorLiteral(red: 0.9201951101, green: 0.2655968123, blue: 0.311134614, alpha: 1)
        }
    }
    
    @IBAction func earthClicked(_ sender: UIButton){
        playerAnswer = "Earth"
        if nation[currentNameIndex] == playerAnswer{
            answerLabel.text = "Correct"
            answerLabel.backgroundColor = #colorLiteral(red: 0.5169595388, green: 0.9201951101, blue: 0.3829920078, alpha: 1)
        } else{
            answerLabel.text = "Incorrect"
            answerLabel.backgroundColor = #colorLiteral(red: 0.9201951101, green: 0.2655968123, blue: 0.311134614, alpha: 1)
        }
    }
    
    @IBAction func waterClicked(_ sender: UIButton){
        playerAnswer = "Water"
        if nation[currentNameIndex] == playerAnswer{
            answerLabel.text = "Correct"
            answerLabel.backgroundColor = #colorLiteral(red: 0.5169595388, green: 0.9201951101, blue: 0.3829920078, alpha: 1)
        } else{
            answerLabel.text = "Incorrect"
            answerLabel.backgroundColor = #colorLiteral(red: 0.9201951101, green: 0.2655968123, blue: 0.311134614, alpha: 1)
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        nameLabel.text = names[currentNameIndex]
        answerLabel.text = " "
        answerLabel.backgroundColor = #colorLiteral(red: 0.9201951101, green: 0.8659230929, blue: 0.7443945736, alpha: 1)
        
    }
}
