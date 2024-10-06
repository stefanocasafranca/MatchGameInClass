//
//  ViewController.swift
//  MatchGameInClass
//
//  Created by Stefano Casafranca Laos on 10/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    // Declare the game instance inside the ViewController
    var game = MatchGame()  // MatchGame from your struct logic
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        game.newGame()
        showCardsButtons()
    }
    
    func showCardsButtons(){
        for tag in 0..<game.cards.count{
            
            if game.cards[tag].cellState == .Hidden {
                cardButtons[tag].setImage(UIImage(named: "question-mark"), for: .normal)
            } else {
                let name = game.cards[tag].name
                cardButtons[tag].setImage(UIImage(named: name), for: .normal)
            }
        }
    }
    
    @IBAction func pressedCardButton(_ sender: UIButton){
        game.processSelection(at: sender.tag)
        
            showCardsButtons()
    }
        
}
    

