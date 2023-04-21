//
//  ViewController.swift
//  Card Counter
//
//  Created by Ismaël Mohammed on 2023-03-21.
//  Copyright © 2023 Ismael Mohammed. All rights reserved.
//
//  Nombre de decks, stastistiques, cutting, basic strategy

import UIKit
import Foundation

class ViewController: UIViewController {
    
    let lutHardHands: [Int: [Int: String]] = [
        5: [2: "H", 3: "H", 4: "H", 5: "H", 6: "H", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        6: [2: "H", 3: "H", 4: "H", 5: "H", 6: "H", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        7: [2: "H", 3: "H", 4: "H", 5: "H", 6: "H", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        8: [2: "H", 3: "H", 4: "H", 5: "H", 6: "H", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        9: [2: "H", 3: "D", 4: "D", 5: "D", 6: "D", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        10: [2: "D", 3: "D", 4: "D", 5: "D", 6: "D", 7: "D", 8: "D", 9: "D", 10: "H", 11: "H"],
        11: [2: "D", 3: "D", 4: "D", 5: "D", 6: "D", 7: "D", 8: "D", 9: "D", 10: "D", 11: "H"],
        12: [2: "H", 3: "H", 4: "S", 5: "S", 6: "S", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        13: [2: "S", 3: "S", 4: "S", 5: "S", 6: "S", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        14: [2: "S", 3: "S", 4: "S", 5: "S", 6: "S", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        15: [2: "S", 3: "S", 4: "S", 5: "S", 6: "S", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        16: [2: "S", 3: "S", 4: "S", 5: "S", 6: "S", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        17: [2: "S", 3: "S", 4: "S", 5: "S", 6: "S", 7: "S", 8: "S", 9: "S", 10: "S", 11: "S"],
        18: [2: "S", 3: "S", 4: "S", 5: "S", 6: "S", 7: "S", 8: "S", 9: "S", 10: "S", 11: "S"],
        19: [2: "S", 3: "S", 4: "S", 5: "S", 6: "S", 7: "S", 8: "S", 9: "S", 10: "S", 11: "S"],
        20: [2: "S", 3: "S", 4: "S", 5: "S", 6: "S", 7: "S", 8: "S", 9: "S", 10: "S", 11: "S"]
    ]
    
    let lutSoftHands: [Int: [Int: String]] = [
        13: [2: "H", 3: "H", 4: "H", 5: "D", 6: "D", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        14: [2: "H", 3: "H", 4: "H", 5: "D", 6: "D", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        15: [2: "H", 3: "H", 4: "D", 5: "D", 6: "D", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        16: [2: "H", 3: "H", 4: "D", 5: "D", 6: "D", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        17: [2: "H", 3: "D", 4: "D", 5: "D", 6: "D", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        18: [2: "S", 3: "D", 4: "D", 5: "D", 6: "D", 7: "S", 8: "S", 9: "H", 10: "H", 11: "H"],
        19: [2: "S", 3: "S", 4: "S", 5: "S", 6: "S", 7: "S", 8: "S", 9: "S", 10: "S", 11: "S"],
        20: [2: "S", 3: "S", 4: "S", 5: "S", 6: "S", 7: "S", 8: "S", 9: "S", 10: "S", 11: "S"]
    ]
    
    let lutPairHands: [Int: [Int: String]] = [
        2: [2: "SP", 3: "SP", 4: "SP", 5: "SP", 6: "SP", 7: "SP", 8: "H", 9: "H", 10: "H", 11: "H"],
        3: [2: "SP", 3: "SP", 4: "SP", 5: "SP", 6: "SP", 7: "SP", 8: "H", 9: "H", 10: "H", 11: "H"],
        4: [2: "H", 3: "H", 4: "H", 5: "SP", 6: "SP", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        5: [2: "D", 3: "D", 4: "D", 5: "D", 6: "D", 7: "D", 8: "D", 9: "D", 10: "H", 11: "H"],
        6: [2: "SP", 3: "SP", 4: "SP", 5: "SP", 6: "SP", 7: "H", 8: "H", 9: "H", 10: "H", 11: "H"],
        7: [2: "SP", 3: "SP", 4: "SP", 5: "SP", 6: "SP", 7: "SP", 8: "H", 9: "H", 10: "H", 11: "H"],
        8: [2: "SP", 3: "SP", 4: "SP", 5: "SP", 6: "SP", 7: "SP", 8: "SP", 9: "SP", 10: "SP", 11: "SP"],
        9: [2: "SP", 3: "SP", 4: "SP", 5: "SP", 6: "SP", 7: "S", 8: "SP", 9: "SP", 10: "S", 11: "S"],
        10: [2: "S", 3: "S", 4: "S", 5: "S", 6: "S", 7: "S", 8: "S", 9: "S", 10: "S", 11: "S"],
        11: [2: "SP", 3: "SP", 4: "SP", 5: "SP", 6: "SP", 7: "SP", 8: "SP", 9: "SP", 10: "SP", 11: "SP"]
    ]
    
    var shuffledDeck = [String]()
    var playerHand = ["p"]
    var splitHand = ["s"]
    var dealerHand = ["d"]
    var playerTags = [Int]()
    var splitTags = [Int]()
    var dealerTags = [Int]()
    var playerHandTotal = 0
    var dealerHandTotal = 0
    var splitHandTotal = 0
    var tag = 1
    var hideCard = true
    var split = false
    var currentHand = "blank"
    var dim = true
    var undim = false
    var count = 0
    var firstHand = true
    var handsPlayed = 0
    var handsWon = 0
    var hardHands = [String]()
    var softHands = [String]()
    var pairHands = [String]()
    
    var playerXDif = 10
    var playerYDif = 10
    var dealerXDif = 10
    var dealerYDif = 0
    var handPosition = 158
    var animationDelay = 0.9
    var playerAnimationDelay = 0.9
    var numberOfDecks = 6
    
    
    @IBOutlet weak var algorithmButton: UIButton!
    @IBOutlet weak var strategyButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var dealButton: UIButton!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var standButton: UIButton!
    @IBOutlet weak var doubleButton: UIButton!
    
    func setDoubleBtnTextColor() {
        // Set the text color of the button for the normal state
        doubleButton.setTitleColor(.systemBackground, for: .normal)
        doubleButton.setTitleColor(.gray, for: .disabled)
    }
    
    func countLut(_ lut: [Int: [Int: String]]) -> Int {
        var count = 0

        for (_, innerDict) in lut {
            count += innerDict.count
        }

        return count
    }
    
    func displayHandTotal(hand: [String], xOffset: Int, yOffset: Int) {
        let handTotalValue = handTotal(hand: hand)
        
        let circleDiameter: CGFloat = 30
        let circleOffset: CGFloat = 10

        let totalLabel = UILabel()
        totalLabel.text = "\(handTotalValue)"
        totalLabel.textColor = .white
        totalLabel.font = UIFont.boldSystemFont(ofSize: 15)
        totalLabel.textAlignment = .center
        totalLabel.frame.size = CGSize(width: circleDiameter, height: circleDiameter)
        totalLabel.layer.cornerRadius = circleDiameter / 2
        totalLabel.layer.masksToBounds = true
        totalLabel.backgroundColor = UIColor.gray
        
        totalLabel.tag = tag
        tag += 1

        if hand[0] == "p" {
            playerTags.append(totalLabel.tag)
        } else if hand[0] == "d" {
            dealerTags.append(totalLabel.tag)
        } else if hand[0] == "s" {
            splitTags.append(totalLabel.tag)
        }
        
        //CGPoint(x: xOffset - Int(circleDiameter + circleOffset), y: yOffset)
        totalLabel.frame.origin = CGPoint(x: xOffset, y: yOffset)
        view.addSubview(totalLabel)
    }

    func outcomeToText(character: String) -> String {
        var outcome = ""
        
        if(character == "H"){
            outcome = "hit"
        }
        
        else if(character == "S"){
            outcome = "stand"
        }
        
        else if(character == "SP"){
            outcome = "split"
        }
        
        else if(character == "D"){
            outcome = "double"
        }
        
        return outcome
    }
    
    func pairHandsTest()->Bool {
        var passed = true
        var appendedString = ""
        
        for playerHandValue in 2...11 {
            for dealerUpcard in 2...11 {
                let expectedAction = lutPairHands[playerHandValue]![dealerUpcard]!
                let actualAction = getDecisionPairHands(playerTotal: playerHandValue, dealerCard:dealerUpcard)
                
                if actualAction != expectedAction {
                    appendedString = "Time: \(String(format: "%.2f", CACurrentMediaTime())) -  Mismatch! Player pair: \(playerHandValue), dealer's card: \(dealerUpcard), expected action: \(expectedAction), algorithm's action: \(actualAction)"
                    passed = false
                }
                
                else {
                   appendedString = "Time: \(String(format: "%.2f", CACurrentMediaTime())) - Match! Player pair: \(playerHandValue), dealer's card: \(dealerUpcard), expected action: \(expectedAction), algorithm's action: \(actualAction)"
                }
                
                pairHands.append(appendedString)
            }
        }
        
        return passed
    }

    func getDecisionPairHands(playerTotal: Int, dealerCard: Int) -> String {
        if playerTotal == 2 || playerTotal == 3 {
            if dealerCard >= 2 && dealerCard <= 7 {
                return "SP"
            } else {
                return "H"
            }
        } else if playerTotal == 4 {
            if dealerCard == 5 || dealerCard == 6 {
                return "SP"
            } else {
                return "H"
            }
        } else if playerTotal == 5 {
            if dealerCard <= 9 {
                return "D"
            } else {
                return "H"
            }
        } else if playerTotal == 6 {
            if dealerCard >= 2 && dealerCard <= 6 {
                return "SP"
            } else {
                return "H"
            }
        } else if playerTotal == 7 {
            if dealerCard >= 2 && dealerCard <= 7 {
                return "SP"
            } else {
                return "H"
            }
        } else if playerTotal == 8 {
            return "SP"
        } else if playerTotal == 9 {
            if dealerCard == 7 || dealerCard == 10 || dealerCard == 11 {
                return "S"
            } else {
                return "SP"
            }
        } else if playerTotal == 10 {
            return "S"
        } else if playerTotal == 11 {
            return "SP"
        } else {
            return "" // This case should not be reached, but it's included to avoid compilation errors
        }
    }

    func softHandsTest()->Bool {
        var passed = true
        var appendedString = ""
        
        for playerHandValue in 13...20 {
            for dealerUpcard in 2...11 {
                let expectedAction = lutSoftHands[playerHandValue]![dealerUpcard]!
                let actualAction = getDecisionSoftHands(playerTotal: playerHandValue, dealerCard:dealerUpcard)
                
                if actualAction != expectedAction {
                   appendedString = "Time: \(String(format: "%.2f", CACurrentMediaTime())) - Mismatch! Player soft total: \(playerHandValue), dealer's card: \(dealerUpcard), expected action: \(expectedAction), algorithm's action: \(actualAction)"
                    passed = false
                }
                
                else {
                   appendedString = "Time: \(String(format: "%.2f", CACurrentMediaTime())) - Match! Player soft total:: \(playerHandValue), dealer's card: \(dealerUpcard), expected action: \(expectedAction), algorithm's action: \(actualAction)"
                }
                
                softHands.append(appendedString)
            }
        }
        
        return passed
    }
    
    func getDecisionSoftHands(playerTotal: Int, dealerCard: Int) -> String {
        if playerTotal >= 13 && playerTotal <= 14 {
            if dealerCard >= 5 && dealerCard <= 6 {
                return "D"
            } else {
                return "H"
            }
        } else if playerTotal >= 15 && playerTotal <= 16 {
            if dealerCard >= 4 && dealerCard <= 6 {
                return "D"
            } else {
                return "H"
            }
        } else if playerTotal == 17 {
            if dealerCard >= 3 && dealerCard <= 6 {
                return "D"
            } else {
                return "H"
            }
        } else if playerTotal == 18 {
            if dealerCard >= 3 && dealerCard <= 6 {
                return "D"
            } else if dealerCard >= 2 && dealerCard <= 8 {
                return "S"
            } else {
                return "H"
            }
        } else {
            return "S"
        }
    }

    func hardHandsTest()->Bool {
        var passed = true
        var appendedString = ""
        
        //Going through each possible player hand
        for playerHandValue in 5...20 {
            //Paired with each possible dealer hand
            for dealerUpcard in 2...11 {
                let expectedAction = lutHardHands[playerHandValue]![dealerUpcard]!
                let actualAction = getDecisionHardHands(playerTotal: playerHandValue, dealerCard:dealerUpcard)
                //Comparing LUT to algorithm output
                if actualAction != expectedAction {
                    appendedString = "Time: \(String(format: "%.2f", CACurrentMediaTime())) - Mismatch! Player total: \(playerHandValue), dealer's card: \(dealerUpcard), expected action: \(expectedAction), algorithm's action: \(actualAction)"
                    passed = false
                }
                
                else {
                   appendedString = "Time: \(String(format: "%.2f", CACurrentMediaTime())) - Match! Player total: \(playerHandValue), dealer's card: \(dealerUpcard), expected action: \(expectedAction), algorithm's action: \(actualAction)"
                }
                
                //Storing comparison for log file
                hardHands.append(appendedString)
            }
        }
        
        //Return true if 100% accurate
        return passed
    }
    
    func getDecisionHardHands(playerTotal: Int, dealerCard: Int) -> String {
        if playerTotal >= 5 && playerTotal <= 8 {
            return "H"
        } else if playerTotal == 9 {
            if dealerCard > 2 && dealerCard <= 6 {
                return "D"
            } else {
                return "H"
            }
        } else if playerTotal == 10 {
            if dealerCard <= 9 {
                return "D"
            } else {
                return "H"
            }
        } else if playerTotal == 11 {
            if dealerCard <= 10 {
                return "D"
            } else {
                return "H"
            }
        } else if playerTotal == 12 {
            if dealerCard >= 4 && dealerCard <= 6 {
                return "S"
            } else {
                return "H"
            }
        } else if playerTotal >= 13 && playerTotal <= 16 {
            if dealerCard >= 2 && dealerCard <= 6 {
                return "S"
            } else {
                return "H"
            }
        } else {
            return "S"
        }
    }

    func cardToValueForLUT(card: String) -> Int {
        var numericValue = Int(card.suffix(2))
        if(numericValue ?? 0 > 10){
            numericValue = 10
        }
        
        if(numericValue ?? 0 == 1){
            numericValue = 11
        }
        
        return numericValue ?? 0
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
    
    func cardValueToCount(cardValue: Int) -> Int {
        var count = 9
        
        if(cardValue <= 6 && cardValue != 1){
            count = 1
        }
        
        else if(cardValue >= 7  && cardValue < 10){
            count = 0
        }
        
        else if(cardValue >= 10  || cardValue == 1){
            count = -1
        }
        
        return count
    }
    
    func cardValue(card: String) -> Int {
        let slice = card.suffix(2)
        var value = 0
        if slice[slice.startIndex] == "0" {
            value = Int(String(slice.suffix(1))) ?? 0
        } else {
            value = Int(String(slice)) ?? 0
        }
        return value
    }
    
    func dimOrUndim(withTags tags: [Int], dim: Bool) {
        let alphaValue: CGFloat = dim ? 0.5 : 1.0 // Ternary operator to set alpha based on dim flag
        
        for tag in tags {
            if let imageView = view.viewWithTag(tag) as? UIImageView {
                imageView.alpha = alphaValue // Set alpha to alphaValue to dim or undim the image
            }
        }
    }

    func resetGame() {
        playerHand = ["p"]
        splitHand = ["s"]
        dealerHand = ["d"]
        playerHandTotal = 0
        dealerHandTotal = 0
        splitHandTotal = 0
        tag = 0
        hideCard = true
        split = false
        currentHand = "blank"
        firstHand = true
        doubleButton.isEnabled = true
        setDoubleBtnTextColor()
        clearHand(hand: dealerHand)
    }
    
    func handTotal(hand: [String]) -> Int {
        var total = 0
        var numAces = 0
        
        for card in hand {
            let value = card.suffix(2)
            if value == "01" {
                numAces += 1
                total += 11
            } else if value == "11" || value == "12" || value == "13" {
                total += 10
            } else {
                total += Int(value) ?? 0
            }
        }
        
        // Adjust total for aces
        while total > 21 && numAces > 0 {
            total -= 10
            numAces -= 1
        }
        
        return total
    }
    
    func clearHand(hand: [String]) {
       // Remove existing UIImageViews with tags in playerTags
        if hand[0] == "p" {
           for subview in view.subviews {
               if let imageView = subview as? UIImageView, playerTags.contains(imageView.tag) {
                   imageView.removeFromSuperview()
               }
           }
            playerTags.removeAll()
        }
        
        // Remove existing UIImageViews with tags in dealerTags
        else if hand[0] == "d" {
            for subview in view.subviews {
                if let imageView = subview as? UIImageView, dealerTags.contains(imageView.tag) {
                    imageView.removeFromSuperview()
                }
            }
            dealerTags.removeAll()
        }
        
        else if hand[0] == "s" {
            for subview in view.subviews {
                if let imageView = subview as? UIImageView, splitTags.contains(imageView.tag) {
                    imageView.removeFromSuperview()
                }
            }
            dealerTags.removeAll()
        }
    }
    
    func displayHand(hand: [String], xOffset: Int, yOffset: Int, xDif: Int, yDif: Int) {
            
        let cardWidth = 60
        let cardHeight = 90
        clearHand(hand: hand)
        
        if(split == false){
            clearHand(hand: splitHand)
        }
        
        // Add new UIImageViews for each card in the hand
        var cardImage: UIImage?
        for (index, card) in hand.dropFirst().enumerated() {
            if hideCard == true && hand[0] == "d" && index == 0 {
                cardImage = UIImage(named: "card_back")
                hideCard = false
            }
                
            else {
                cardImage = UIImage(named: card)
            }
            
            let cardImageView = UIImageView(image: cardImage)
            cardImageView.frame = CGRect(x: Int(UIScreen.main.bounds.width), y: 0, width: cardWidth, height: cardHeight) // Start at top right corner
            cardImageView.tag = tag
            tag+=1
            
            if hand[0] == "p" {
                playerTags.append(cardImageView.tag)
            }
                
            else if hand[0] == "d" {
                dealerTags.append(cardImageView.tag)
            }
                
            else if hand[0] == "s" {
                splitTags.append(cardImageView.tag)
            }
            
            view.addSubview(cardImageView)
            
            // Animate card movement to final position
            if (firstHand || index == hand.count - 2 && hand[0] != "d") {
                UIView.animate(withDuration: 0.5, delay: Double(index) * 0.1, options: [.curveEaseOut], animations: {
                    cardImageView.frame = CGRect(x: xOffset + (index * xDif), y: yOffset - (index * yDif), width: cardWidth, height: cardHeight)
                }, completion: nil)
            }
            
            else if(hand[0] == "d" && index > 1 && index < hand.count){
                UIView.animate(withDuration: 0.5, delay: Double(index) * 0.5, options: [.curveEaseOut], animations: {
                        cardImageView.frame = CGRect(x: xOffset + (index * xDif), y: yOffset - (index * yDif), width: cardWidth, height: cardHeight)
                    }, completion: nil)
            }
            else {
                cardImageView.frame = CGRect(x: xOffset + (index * xDif), y: yOffset - (index * yDif), width: cardWidth, height: cardHeight)
            }
        }
        
        //displayHandTotal(hand: hand, xOffset: xOffset, yOffset: yOffset - cardHeight - 10)
        
        firstHand = false
    }

    //Returns an array of Strings that is 6 shuffled decks of cards
    func shuffleDeck() -> [String] {
        
        //The suits of the cards in the deck
        let suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
        
        //The values of the cards in the deck
        let values = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13"]
        
        //The returned deck
        var deck = [String]()
        
        //Each element of the deck array is the name of the suit + the value of the card e.i "Clubs02". deck contains 6*52 //elements representing 6 decks
        for _ in 0..<6 {
            for suit in suits {
                for value in values {
                    let cardName = suit + value
                    deck.append(cardName)
                }
            }
        }
        
        //We shuffle the elements of the deck
        deck.shuffle()
        //Player hand
        //deck[0] = "Diamonds02"
        //deck[1] = "Diamonds02"
        
        //Dealer hidden
        //deck[2] = "Diamonds05"
        
        //Dealer upcard
        //deck[3] = "Clubs02"
        return deck
    }

    @IBAction func dealBtnClicked(_ sender: Any) {
        //If there are more than 3 cards in the deck
        if shuffledDeck.count >= 3 {
            // Move first two cards to playerHand
            playerHand.append(shuffledDeck.removeFirst())
            playerHand.append(shuffledDeck.removeFirst())
            
            // Move third and fourth card to dealerHand
            dealerHand.append(shuffledDeck.removeFirst())
            dealerHand.append(shuffledDeck.removeFirst())
        }
            

        else {
            // Handle the case where there aren't enough cards left in the deck
            print("Not enough cards in deck to deal.")
            return
        }
        
        handsPlayed = handsPlayed + 1
        
        dealButton.isHidden = true
        dealButton.isEnabled = false
        hitButton.isEnabled = true
        hitButton.isHidden = false
        standButton.isEnabled = true
        standButton.isHidden = false
        doubleButton.isEnabled = true
        doubleButton.isHidden = false
        
        //Calculation new handTotals
        playerHandTotal = handTotal(hand: playerHand)
        dealerHandTotal = handTotal(hand: dealerHand)
        
        //Displaying hands (dealer has hidden card)
        displayHand(hand: playerHand, xOffset: 158, yOffset: 580,
                    xDif: playerXDif, yDif: playerYDif)
        
        displayHand(hand: dealerHand, xOffset: 148, yOffset: 100,
                    xDif: dealerXDif, yDif: dealerYDif)
        
        //Updating count after displaying hands
        count = count + cardToCount(card: dealerHand[2]) +
            cardToCount(card: playerHand[1]) + cardToCount(card: playerHand[2])
        
        
        if (dealerHandTotal == 21 && playerHandTotal != 21) {
            count = count - 1
            displayHand(hand: dealerHand, xOffset: 148, yOffset: 100, xDif: 15, yDif: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + playerAnimationDelay) {
                let alert = UIAlertController(title: "Dealer has Blackjack!", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                    self.resetGame()
                    self.dealBtnClicked(self)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        else if (playerHandTotal == 21) {
            count = count - 1
            displayHand(hand: dealerHand, xOffset: 148, yOffset: 100, xDif: 15, yDif: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + playerAnimationDelay) {
                let alert = UIAlertController(title: "Player has Blackjack!", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                    self.handsWon = self.handsWon + 1
                    self.resetGame()
                    self.dealBtnClicked(self)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        else if (playerHandTotal == 21 && dealerHandTotal == 21) {
            count = count - 1
            displayHand(hand: dealerHand, xOffset: 148, yOffset: 100, xDif: 15, yDif: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + playerAnimationDelay) {
                let alert = UIAlertController(title: "Push! Both player and dealer have Blackjack.", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                    self.resetGame()
                    self.dealBtnClicked(self)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        else if (playerHand[1].suffix(2) == playerHand[2].suffix(2)) {
            DispatchQueue.main.asyncAfter(deadline: .now() + playerAnimationDelay) {
                let alert = UIAlertController(title: "Split?", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "No", style: .default, handler: { _ in
                }))
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                    self.handsPlayed = self.handsPlayed + 1
                    self.split = true
                    self.currentHand = "player"
                    self.splitHand.append(self.playerHand.remove(at: 1))
                    self.displayHand(hand: self.splitHand, xOffset: 98, yOffset: 580, xDif: self.playerXDif, yDif: self.playerYDif)
                    if(self.playerHand[1].suffix(2) == "01"){
                    
                        //if self.shuffledDeck.count >= 2 {
                        //self.playerHand.append(self.shuffledDeck.removeFirst())
                        //self.splitHand.append(self.shuffledDeck.removeFirst())
                        //}
                    
                        //self.playerHandTotal = self.handTotal(hand: self.playerHand)
                        //self.splitHandTotal = self.handTotal(hand: self.splitHand)
                    
                        //self.displayHand(hand: self.playerHand, xOffset: 208, yOffset: 580, xDif: self.playerXDif, yDif: self.playerYDif)

                        self.hitBtnClicked(self)
                        self.standBtnClicked(self)
                        self.hitBtnClicked(self)
                        self.standBtnClicked(self)
                    }
                
                    else {
                        self.hitBtnClicked(self)
                        self.dimOrUndim(withTags: self.splitTags, dim: self.dim)
                    }
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }

    }
    @IBAction func hitBtnClicked(_ sender: Any) {
        guard shuffledDeck.count > 0 else {
            print("No more cards in deck.")
            return
        }
        
        if(currentHand == "blank"){
            doubleButton.isEnabled = false
            setDoubleBtnTextColor()
        }
        
        else if(currentHand == "player" && playerHand.count > 2 ){
            doubleButton.isEnabled = false
            setDoubleBtnTextColor()
        }
        
        else if(currentHand == "split" && splitHand.count > 2 ){
            doubleButton.isEnabled = false
            setDoubleBtnTextColor()
        }
        
        
        count = count + cardToCount(card: shuffledDeck[0])
        
        //If current hand is a split hand
        if(currentHand == "player"){
            
            //Shoe's top card added to split hand and removed from shoe
            playerHand.append(shuffledDeck.removeFirst())
            
            //Display updated hand
            displayHand(hand: playerHand, xOffset: 208, yOffset: 580, xDif: playerXDif, yDif: playerYDif)
            
            //Update player's total
            playerHandTotal = handTotal(hand: playerHand)
            
            //Verify bust
            if playerHandTotal > 21 {
                //Alert
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "Busted!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                        //Turn double back on
                        self.doubleButton.isEnabled = true
                        self.setDoubleBtnTextColor()
                        //Change hand to second split hand
                        self.currentHand = "split"
                        //Undim
                        self.dimOrUndim(withTags: self.splitTags, dim: self.undim)
                        self.dimOrUndim(withTags: self.playerTags, dim: self.dim)
                        //Recursion with currentHand == "split"
                        self.hitBtnClicked(self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
        else if(currentHand == "split"){
            splitHand.append(shuffledDeck.removeFirst())
            
            displayHand(hand: splitHand, xOffset: 98, yOffset: 580, xDif: playerXDif, yDif: playerYDif)
            
            splitHandTotal = handTotal(hand: splitHand)
            
            if(splitHandTotal > 21 && playerHandTotal > 21) {
                self.displayHand(hand: self.dealerHand, xOffset: 148, yOffset: 100, xDif: self.dealerXDif, yDif: self.dealerYDif)
                self.count = self.count + self.cardToCount(card: self.dealerHand[1])
                DispatchQueue.main.asyncAfter(deadline: .now() + playerAnimationDelay) {
                    let alert = UIAlertController(title: "Both hands busted!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                        self.dimOrUndim(withTags: self.playerTags, dim: self.undim)
                        self.resetGame()
                        self.dealBtnClicked(self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
            else if(splitHandTotal > 21 && playerHandTotal <= 21){
                DispatchQueue.main.asyncAfter(deadline: .now() + playerAnimationDelay) {
                    let alert = UIAlertController(title: "Busted", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                        self.standBtnClicked(self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    
        else if(currentHand == "blank"){
        
            // Add the top card of the deck to the player's hand
            playerHand.append(shuffledDeck.removeFirst())
        
            // Display the updated player's hand
            displayHand(hand: playerHand, xOffset: 158, yOffset: 580, xDif: playerXDif, yDif: playerYDif)
        
            playerHandTotal = handTotal(hand: playerHand)
            //print(playerHandTotal)
        
            if playerHandTotal > 21 {
                DispatchQueue.main.asyncAfter(deadline: .now() + playerAnimationDelay) {
                    self.count = self.count + self.cardToCount(card: self.dealerHand[1])
                    self.displayHand(hand: self.dealerHand, xOffset: 148, yOffset: 100, xDif: self.dealerXDif, yDif: self.dealerYDif)
                    let alert = UIAlertController(title: "Player busted!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                        self.resetGame()
                        self.dealBtnClicked(self)
                }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func standBtnClicked(_ sender: Any) {
        if(currentHand == "player"){
            doubleButton.isEnabled = true
            setDoubleBtnTextColor()
            currentHand = "split"
            dimOrUndim(withTags: splitTags, dim: undim)
            dimOrUndim(withTags: playerTags, dim: dim)
            if(cardValue(card: playerHand[1]) != 1){
                hitBtnClicked(self)
            }
            return
        }
        
        else {
            displayHand(hand: dealerHand, xOffset: 148, yOffset: 100, xDif: dealerXDif, yDif: dealerYDif)
            count = count + cardToCount(card: dealerHand[1])
            
            while(dealerHandTotal < 17) {
                guard shuffledDeck.count > 0 else {
                    print("No more cards in deck.")
                    return
                }
                count = count + cardToCount(card: shuffledDeck[0])
                print(count)
                // Add the top card of the deck to the player's hand
                dealerHand.append(shuffledDeck.removeFirst())
                
                dealerHandTotal = handTotal(hand: dealerHand)
                
                // Display the updated dealer's hand
                displayHand(hand: dealerHand, xOffset: 148, yOffset: 100, xDif: dealerXDif, yDif: dealerYDif)
                //print("/////")
                //print(dealerHandTotal)
            }
        }
        
        animationDelay = 1*(Double((dealerHand.count - 3)))
        if(dealerHand.count == 3){
            animationDelay = 0.7
        }
        
        if(currentHand == "split"){
            dimOrUndim(withTags: playerTags, dim: undim)
            // Both hands win
            if (playerHandTotal <= 21 && splitHandTotal <= 21 && dealerHandTotal > 21) || (playerHandTotal <= 21 && splitHandTotal <= 21 && playerHandTotal > dealerHandTotal && splitHandTotal > dealerHandTotal) {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "Both hands win!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                        self.handsWon = self.handsWon + 2
                        self.resetGame()
                        self.dealBtnClicked(self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }

            // One hand wins, one hand loses
            else if ((playerHandTotal <= 21 && dealerHandTotal <= 21 && playerHandTotal > dealerHandTotal) && (splitHandTotal > 21 || splitHandTotal <= dealerHandTotal)) || ((splitHandTotal <= 21 && dealerHandTotal <= 21 && splitHandTotal > dealerHandTotal) && (playerHandTotal > 21 || playerHandTotal <= dealerHandTotal)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "One hand wins, one hand loses!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                        self.handsWon = self.handsWon + 1
                        self.resetGame()
                        self.dealBtnClicked(self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }

            // Both hands lose
            else if (playerHandTotal > 21 && splitHandTotal > 21) || (playerHandTotal <= 21 && splitHandTotal <= 21 && dealerHandTotal <= 21 && dealerHandTotal > playerHandTotal && dealerHandTotal > splitHandTotal) {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "Both hands lose!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                        self.resetGame()
                        self.dealBtnClicked(self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }

            // One hand wins, one hand pushes
            else if ((playerHandTotal == dealerHandTotal) && (splitHandTotal > dealerHandTotal && splitHandTotal <= 21)) || ((splitHandTotal == dealerHandTotal) && (playerHandTotal > dealerHandTotal && playerHandTotal <= 21)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDelay) {
                    let alert = UIAlertController(title: "One hand wins, one hand pushes!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                        self.handsWon = self.handsWon + 1
                        self.resetGame()
                        self.dealBtnClicked(self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }

            // One hand pushes, one hand loses
            else if ((playerHandTotal == dealerHandTotal) && (splitHandTotal < dealerHandTotal || splitHandTotal > 21)) || ((splitHandTotal == dealerHandTotal) && (playerHandTotal < dealerHandTotal || playerHandTotal > 21)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "One hand pushes, one hand loses!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                        self.handsWon = self.handsWon + 1
                        self.resetGame()
                        self.dealBtnClicked(self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }

            // One hand busts, one hand pushes
            else if ((playerHandTotal > 21 && splitHandTotal <= 21 && splitHandTotal >= dealerHandTotal) || (splitHandTotal > 21 && playerHandTotal <= 21 && playerHandTotal >= dealerHandTotal)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "One hand busts, one hand pushes!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                        self.resetGame()
                        self.dealBtnClicked(self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }

            // Both hands push
            else if (dealerHandTotal == playerHandTotal && dealerHandTotal == splitHandTotal && dealerHandTotal <= 21) {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "Push for both hands!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                        self.resetGame()
                        self.dealBtnClicked(self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }

            // One hand busts, one hand loses
            else if ((playerHandTotal > 21 && splitHandTotal > 21) || (playerHandTotal > 21 && splitHandTotal < dealerHandTotal || splitHandTotal > 21 && playerHandTotal < dealerHandTotal)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "One hand busts, one hand loses!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                        self.resetGame()
                        self.dealBtnClicked(self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
        else {
            if dealerHandTotal > 21 {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "Dealer busted!", message: nil, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                            self.handsWon = self.handsWon + 1
                            self.resetGame()
                            self.dealBtnClicked(self)
                        }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        
            else if dealerHandTotal > playerHandTotal {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "Dealer won! Dealer has \(self.dealerHandTotal) and player has \(self.playerHandTotal).", message:   nil, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                            self.resetGame()
                            self.dealBtnClicked(self)
                        }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        
    
            else if dealerHandTotal < playerHandTotal {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "Player won! Dealer has \(self.dealerHandTotal) and player has \(self.playerHandTotal).", message:   nil, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                            self.handsWon = self.handsWon + 1
                            self.resetGame()
                            self.dealBtnClicked(self)
                        }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        
            else if dealerHandTotal == playerHandTotal {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    let alert = UIAlertController(title: "Push! Dealer has \(self.dealerHandTotal) and player has \(self.playerHandTotal).", message: nil,    preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Deal next hand", style: .default, handler: { _ in
                            self.resetGame()
                            self.dealBtnClicked(self)
                        }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func doubleBtnClicked(_ sender: Any) {
        self.hitBtnClicked(self)
        if(playerHandTotal <= 21){
            self.standBtnClicked(self)
        }
    }
    @IBAction func countBtnClicked(_ sender: Any) {
        var countString = String(count)

        if(count > 0){
            countString = "+" + String(count)
        }
        
        
        let alert = UIAlertController(title: "The current count is \(countString).", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
        }))
        present(alert, animated: true, completion: nil)
    }
    @IBAction func statsBtnClicked(_ sender: Any) {
        var numberOfFaces = 0
        for cardd in shuffledDeck {
            if(cardValue(card: cardd) == 1 || cardValue(card: cardd) > 9){
                numberOfFaces = numberOfFaces + 1
            }
        }
        
        //print("new")
        //print(handsWon)
        //print(handsPlayed)
        //var winRate = Double(handsWon)/Double(handsPlayed)
        //print(winRate)
        
        var winRate: Double = 0
        let adjustedHandsPlayed = handsPlayed - 1
        
        if(adjustedHandsPlayed > 0){
            winRate = 100*Double(handsWon)/Double(adjustedHandsPlayed)
        }
        
        let alert = UIAlertController(title: "Stats", message: "Number of decks left: \(String(format: "%.2f", Double(shuffledDeck.count)/52)) \n Number of faces left: \(numberOfFaces) \n Hands played this session: \(handsPlayed) \n Win rate:  \(String(format: "%.2f", winRate))%", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func strategyBtnClicked(_ sender: Any) {
        var decision = ""
        
        //If not currently split
        if(currentHand == "blank"){
            //If hand contains at least 2 cards
            if(playerHand.count > 2){
            //Not a softHand (doesn't contain an ace)
                if(playerHand[1].suffix(2) != "01" && playerHand[2].suffix(2) != "01"){
                    //Decision calculation
                    decision = outcomeToText(character: getDecisionHardHands(playerTotal: handTotal(hand: playerHand), dealerCard: cardToValueForLUT(card: dealerHand[2])))
                
                    let alert = UIAlertController(title: "The right play is to \(decision).", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    }))
                self.present(alert, animated: true, completion: nil)
                }
            
            //Is SoftHand
                else {
                    decision = outcomeToText(character: getDecisionSoftHands(playerTotal: handTotal(hand: playerHand), dealerCard: cardToValueForLUT(card: dealerHand[2])))
                
                    let alert = UIAlertController(title: "The right play is to \(decision).", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
        //Split
        else if(currentHand != "blank"){
            
            //Was split the right play
            let splitOrNotDecision = getDecisionSoftHands(playerTotal: Int(playerHand[1]) ?? 0, dealerCard: cardToValueForLUT(card: dealerHand[2]))
            
            var message = ""
            var decision = ""
            
            if(splitOrNotDecision != "SP"){
                message = outcomeToText(character: splitOrNotDecision).capitalized + " was the right play instead of split"
            }
            
            else{
                message = "Split was the right play"
            }
            
            if(currentHand == "player"){
                decision = outcomeToText(character: getDecisionHardHands(playerTotal: handTotal(hand: playerHand), dealerCard: cardToValueForLUT(card: dealerHand[2])))
                
                let alert = UIAlertController(title: "\(message). For this hand, the right play is to \(decision).", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                }))
                self.present(alert, animated: true, completion: nil)
            }
            
            else if(currentHand == "split"){
                decision = outcomeToText(character: getDecisionHardHands(playerTotal: handTotal(hand: splitHand), dealerCard: cardToValueForLUT(card: dealerHand[2])))
                
                let alert = UIAlertController(title: "For this hand, the right play is to \(decision).", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        
    }
    @IBAction func algorithmButtonClicked(_ sender: Any) {
        //Counting possible number of combinations
        let numberOfCombinations = countLut(lutHardHands) + countLut(lutSoftHands) + countLut(lutPairHands)
        let startTime = CACurrentMediaTime()
        let resultHands = hardHandsTest() && softHandsTest() && pairHandsTest()
        let endTime = CACurrentMediaTime()
        let elapsedTime = (endTime - startTime)*1000000
        var output = "Tests failed!"
        
        if(resultHands == true){
            output = "The algorithm was tested for all \(numberOfCombinations) possible combinations and its output was accurate for each of them."
        }
        
        let alert = UIAlertController(title: "Basic strategy algorithm testing", message: "\n \(output) \n \n Test duration: \(String(format: "%.2f", elapsedTime)) microseconds.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Show log", style: .default, handler: { _ in
            guard let vc = self.storyboard?.instantiateViewController(identifier: "log_vc") as? logViewController
            else {
                return
            }
            vc.hardHands = self.hardHands
            vc.softHands = self.softHands
            vc.pairHands = self.pairHands
            self.present(vc, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
        
        //print("Hard hands: \(hardHandsTest())")
        //print("Soft hands: \(softHandsTest())")
        //print("Pair hands: \(pairHandsTest())")
        //print("\(dealerHand[2])")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.tag = 999
        // Do any additional setup after loading the view.
        shuffledDeck = shuffleDeck()
        
        //for card in shuffledDeck {
            //print("Card: \(card) Count: \(cardToCount(card: card))")
        //}
    }
}

