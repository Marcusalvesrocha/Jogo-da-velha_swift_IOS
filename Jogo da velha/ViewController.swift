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

    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        let image = UIImage(named: "cross.png")
        
        (sender as AnyObject).setImage(image, for: .normal)
        print((sender as AnyObject).tag)
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

