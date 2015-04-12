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

var Rounds:[Round] = []
var Players:[Player] = []
var CurrentPlayerID = 0

public struct Round {
    var Definition: String = ""
    
    init(Definition: String) {
        self.Definition = Definition
    }
}

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

public func BeginNewRound(definition: String) {
    Rounds.append(Round(Definition: definition))
}

public func GetCurrentDefinition() -> String {
    return Rounds[Rounds.count - 1].Definition
}

public func AddNewPlayer(name: String) {
    Players.append(Player(Name: name))
}

public func GetCurrentPlayerID() -> Int {
    return CurrentPlayerID
}

public func AddSniglet(sniglet: Sniglet) -> Bool {
    Players[CurrentPlayerID].Sniglets.append(sniglet)
    
    CurrentPlayerID++
    
    CurrentPlayerID = CurrentPlayerID % Players.count
    
    return (CurrentPlayerID == (Rounds.count - 1) % Players.count)
}

public func GetSniglets() -> [Sniglet] {
    var sniglets:[Sniglet] = []
    
    for var i = 0; i < Players.count; i++
    {
        sniglets.append(Players[i].Sniglets[Rounds.count - 1])
    }
    
    return sniglets
}
