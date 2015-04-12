//
//  Game.swift
//  Fictionary
//
//  Created by Nicholas Peterson on 4/10/15.
//  Copyright (c) 2015 Nicholas Peterson. All rights reserved.
//

import Foundation

let MIN_NUM_PLAYERS = 2;
let MAX_NUM_PLAYERS = 8;

var Players:[Player] = []
var CurrentPlayerID = 0
var Round: Int = 1

public struct Player {
    var ID: Int
    var Name: String = ""
    var Sniglets: [Sniglet] = []
    var CorrectGuesses: Int = 0
    var GuessesReceived: Int = 0
    
    init(Name: String) {
        self.ID = Players.count
        self.Name = Name
    }
}

public struct Sniglet {
    var Word: String = ""
    var GuessesReceived: Int = 0
    
    init(Word: String) {
        self.Word = Word
    }
}

public func AddNewPlayer(name: String) {
    Players.append(Player(Name: name))
}

public func AddSniglet(index: Int, sniglet: Sniglet) {
    Players[index].Sniglets.append(sniglet)
}
