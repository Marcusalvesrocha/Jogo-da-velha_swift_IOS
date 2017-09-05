//
//  ViewController.swift
//  Jogo da velha
//
//  Created by Marcus Rocha on 31/08/17.
//  Copyright © 2017 MarcusRocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //1 - O, 2 - X
    
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var gameActive = true
    
    let winCombination = [[0,1,2], [2,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBAction func playAgainPressed(_ sender: AnyObject) {
        
        initialGame()
        resetButtons()
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                image = UIImage(named: "circle.png")!
                activePlayer = 2
            } else {
                image = UIImage(named: "cross.png")!
                activePlayer = 1
            }
            
            sender.setImage(image, for: .normal)
            
            for combination in winCombination {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    var winner = "O Ganhou"
                    
                    if gameState[combination[0]] == 2 {
                        winner = "X Ganhou"
                    }
                    
                    gameOverLabel.text = winner
                    
                    gameOverLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        self.gameOverLabel.center = CGPoint(x: self.gameOverLabel.center.x + 500, y :self.gameOverLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x - 500, y: self.playAgainButton.center.y)
                    })
                    
                    gameActive = false
                }
            }
        }
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButtons()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetButtons() {
        gameOverLabel.isHidden = true
        playAgainButton.isHidden = true
        
        //gameOverLabel.center = CGPoint(x: gameOverLabel.center - 500, gameOverLabel.center.y)
        
        gameOverLabel.center = CGPoint(x: gameOverLabel.center.x - 500, y :gameOverLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y :playAgainButton.center.y)
    }
    
    func initialGame() {
        activePlayer = 1
        gameActive = true
        gameState = [0,0,0,0,0,0,0,0,0]
        
        var button: UIButton
        
        for i in 0 ..< 9 {
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: .normal)
        }
    }

}

