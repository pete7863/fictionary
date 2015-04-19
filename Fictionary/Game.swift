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
    var definition: String = ""
    
    init(Definition: String) {
        self.definition = Definition
    }
}

public struct Player {
    var id: Int
    var name: String = ""
    var sniglets: [Sniglet] = []
    var correctGuesses: Int = 0
    var guessesReceived: Int = 0
    var score: Int = 0
    
    init(Name: String) {
        self.id = Players.count
        self.name = Name
    }
}

public struct Sniglet {
    var ownerID: Int
    var word: String = ""
    var guessesReceived: Int = 0
    
    init(ownerID: Int, word: String) {
        self.ownerID = ownerID
        self.word = word
    }
}

public func BeginNewRound(definition: String) {
    Rounds.append(Round(Definition: definition))
}

public func GetCurrentDefinition() -> String {
    return Rounds[Rounds.count - 1].definition
}

public func AddNewPlayer(name: String) {
    Players.append(Player(Name: name))
}

public func GetCurrentPlayerID() -> Int {
    return CurrentPlayerID
}

public func GetCurrentPlayer() -> Player {
    return Players[CurrentPlayerID]
}

public func GetModeratorID() -> Int {
    return ((Rounds.count - 1) % Players.count)
}

public func IncrementPlayer() {
    CurrentPlayerID++
    CurrentPlayerID = CurrentPlayerID % Players.count
}

//Returns whether the round is over or not
public func AddSniglet(word: String) -> Bool {
    Players[CurrentPlayerID].sniglets.append(Sniglet(ownerID: CurrentPlayerID, word: word))
    
    IncrementPlayer()
    
    //Check to see if we have just entered the final sniglet of the round
    if(CurrentPlayerID == GetModeratorID())
    {
        IncrementPlayer()   //Need to increment past the moderator
        return true
    }
    else
    {
        return false
    }
}

public func GuessSniglet(sniglet: Sniglet, playerID: Int) {
    //Increment the guess count for the sniglet, regardless of who voted for it
    Players[sniglet.ownerID].sniglets[Rounds.count - 1].guessesReceived++
    
    //Give the owner their points...
    //However, no points for voting for yourself you silly :P
    //Also, no points for the moderator
    if((sniglet.ownerID != playerID) && (sniglet.ownerID != GetModeratorID()))
    {
        Players[sniglet.ownerID].score += 3
    }
    
    //Grant points if the correct sniglet is chosen
    if(sniglet.ownerID == GetModeratorID())
    {
        Players[playerID].score += 2
    }
}

public func GetSniglets() -> [Sniglet] {
    var sniglets:[Sniglet] = []
    
    for var i = 0; i < Players.count; i++
    {
        sniglets.append(Players[i].sniglets[Rounds.count - 1])
    }
    
    return sniglets.sorted {$0.word < $1.word}
}
