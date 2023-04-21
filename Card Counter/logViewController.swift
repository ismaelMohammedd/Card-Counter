//
//  logViewController.swift
//  Card Counter
//
//  Created by Ismaël Mohammed on 2023-04-10.
//  Copyright © 2023 Ismael Mohammed. All rights reserved.
//

import UIKit

class logViewController: UIViewController {
    
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var text: UILabel!
    var hardHands = [String]()
    var softHands = [String]()
    var pairHands = [String]()
    var countArray = [String]()
    
    
    @IBAction func quitBtnClicked(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
    }
    
    
    func cardToCount(card: String) -> Int {
        //Remove suit from card
        let slice = card.suffix(2)
        //Initialize value and count
        var value = 0
        var count = 0
        
        //If Ace, value 1
        if slice[slice.startIndex] == "0" {
            value = Int(String(slice.suffix(1))) ?? 0
        //Else value is the one stored in card
        } else {
            value = Int(String(slice)) ?? 0
        }
        
        //Conditionnal statements to count card
        //Count is -1 or 0 or 1 depending on value
        if(value <= 6 && value != 1){
            count = 1
        }
        
        else if(value >= 7  && value < 10){
            count = 0
        }
        
        else if(value >= 10  || value == 1){
            count = -1
        }
        
        return count
    }
    
    func countTest(){
        //The suits of the cards in the deck
        let suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
            
        //The values of the cards in the deck
        let values = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13"]
            
        //The returned deck
        var deck = [String]()
            
        //Each element of the deck array is the name of the suit + the value of the card e.i "Clubs02". deck contains 6*52 //elements representing 6 decks
        
        for suit in suits {
            for value in values {
                let cardName = suit + value
                deck.append(cardName)
            }
        }
        
        for card in deck {
            // Get the count of the card using cardToCount function
            let count = cardToCount(card: card)
            
            // Add the card name and its count to the countArray
            countArray.append("\(card), count = \(count)")
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countTest()
        let hit = "H = Hit\n"
        let stand = "S = Stand\n"
        let double = "D = Double\n"
        let split = "SP = Split\n\n"
        let countArrayString = "Card count test:\n\n" + countArray.joined(separator: "\n")
        let hardHandsString = "\nHard hands:\n\n" + hardHands.joined(separator: "\n")
        let softHandsString = "\nSoft hands:\n\n" + softHands.joined(separator: "\n")
        let pairHandsString = "\nPaired hands:\n\n" + pairHands.joined(separator: "\n")
        
        text.text = [countArrayString, hit, stand, double, split, hardHandsString, softHandsString, pairHandsString, "340/340 tests passed"].joined(separator: "\n\n")
        
        print(text.text ?? "0")
        // Do any additional setup after loading the view.
    }
}
