//
//  MatchGame.swift
//  MatchGameInClass
//
//  Created by Stefano Casafranca Laos on 10/3/24.
//

import Foundation

enum CellState {
    case Hidden
    case Guessed
    case Displayed
    
}

struct Card {
    var name: String
    var cellState: CellState = .Hidden
}

enum GameState{
    case Hidden
    case FirstCardSelected
    case CheckMatches
}

struct MatchGame{
    
    var firstCardSelection = 0
    var secondCardSelection = 0
    
    var cards = [Card(name: "canserbero-logo"), Card(name: "dobleV-logo"),Card(name: "canserbero-logo"), Card(name: "dobleV-logo")]
    
    var state: GameState = .Hidden
    
    
    mutating func newGame () {
        cards.shuffle()
        state = .Hidden
        
    }
    mutating func selectedCardAt (tag:Int){
        if tag < 0 || tag >= cards.count || cards[tag].cellState != .Displayed {
            print("Error, button is out of range")
            return
        }
        cards[tag].cellState = .Displayed
    }
    
    
    
    mutating func processSelection(at tag: Int) {
        
        let card = cards [tag]
        switch state  {
        case .Hidden : //All Cards Are Hidden or Guessed
            switch card.cellState{
            case . Hidden:
                cards[tag] . cellState = .Displayed
                firstCardSelection = tag
                state = .FirstCardSelected
            case . Guessed, .Displayed: print("Error")
            }
        case .FirstCardSelected:
            switch card.cellState{
            case .Hidden:
                cards[tag] . cellState = .Displayed
                firstCardSelection = tag
                if cards [ firstCardSelection].name ==
                    cards[secondCardSelection].name {
                    //both cards matched
                    cards [ firstCardSelection].cellState = .Guessed
                    cards[secondCardSelection].cellState = .Guessed
                    state = .Hidden
                } else  {
                    //mismatch
                    state = .CheckMatches
                }
            case.Guessed,.Displayed:
                print("Error")
                
            }
        case .CheckMatches:
            cards[firstCardSelection].cellState = .Hidden
            cards[secondCardSelection].cellState = .Hidden
            state = .Hidden
        }
        
        
        func display(){
            print(cards)
            
        }
    }
}
    
  var game = MatchGame()
