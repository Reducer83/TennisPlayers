//
//  TennisPlayer.swift
//  TennisPlayers
//
//  Created by Richard Thomson on 07/07/2015.
//  Copyright (c) 2015 Richard Thomson. All rights reserved.
//

import UIKit

class TennisPlayer: NSObject {
    

        var name: String
        var age: Int
        var rank: Int
        var image: UIImage?
        var points: Int
        var games: Int
        var sets: Int
        var server: Bool
        var deuce: Bool
        var totalPoints: Int
    var servePower: Int
    
    override init() {
        
        self.name = "enter name"
        self.age = 0
        self.rank = 0
        self.points = 0
        self.games = 0
        self.sets = 0
        self.server = false
        self.deuce = false
        self.totalPoints = 0
        self.servePower = 0

        
    }
    
    func winGame() {
        
        self.points = 0
        self.games = self.games + 1
        self.deuce = false
        self.server = !self.server
        
        
    }
 
    
    func loseGame() {
        self.points = 0
        self.deuce = false
        self.server = !self.server
    }
    
    
    }

//Game end method?? requires game class
//Set end method
//Set, match. game classes? Or hierachy of classes. Use arrays to list the players?
// Create different sets and log the score for each to display
//fix end of tiebreak behaviour
//Display match info e.g duece number, who won something? on the bottom of the screen
//hawkeye
//dedupe code to apply same logic to "point winner". set point winner
//make server nuetral in tiebreak
//Use array of players to randomly generate a match up without a clash.
//Weird scenarios around scoring. Particularly where both on same number of games. Player two gets assigned 3 points. After a deuece?
//Player class should only hold player data, not live match data
//Add "form element to player
//Add random assignment of aces, double faults, errors etc