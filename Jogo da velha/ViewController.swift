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
    
    let winCombination = [[0,1,2], [2,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        if gameState[sender.tag] == 0{
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
                    print("Temos um vencedor")
                }
            }
        }
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

