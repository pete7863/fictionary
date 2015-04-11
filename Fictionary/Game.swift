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

struct Player {
    var Name: String = ""
    var Fictalabras: [String] = []
    
    init(Name: String) {
        self.Name = Name
        self.Fictalabras = []
    }
}

public func AddNewPlayer(name: String) {
    Players.append(Player(Name: name))
}

public func AddFictalabra(index: Int, fictalabra: String) {
    Players[index].Fictalabras.append(fictalabra)
}
