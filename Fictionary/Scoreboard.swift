//
//  Scoreboard.swift
//  Fictionary
//
//  Created by Nicholas Peterson on 4/14/15.
//  Copyright (c) 2015 Nicholas Peterson. All rights reserved.
//

import Foundation
import UIKit

class Scoreboard: UIViewController {
    
    @IBOutlet weak var HeaderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HeaderLabel.text = "Scoreboard - Round \(Rounds.count)"
        
        var offset = 40
        for var i = 0; i < Players.count ; i++
        {
            var playerLbl: UILabel = UILabel(frame: CGRectZero);
            self.view.addSubview(playerLbl)
            playerLbl.text = "\(Players[i].name) - \(Players[i].score)"
            playerLbl.textColor = UIColor.whiteColor()
            playerLbl.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            let widthConstraint = NSLayoutConstraint(item: playerLbl, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 200)
            let heightConstraint = NSLayoutConstraint(item: playerLbl, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 36)
            
            playerLbl.addConstraint(widthConstraint)
            playerLbl.addConstraint(heightConstraint)
            
            let xConstraint = NSLayoutConstraint(item: playerLbl, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
            let yConstraint = NSLayoutConstraint(item: playerLbl, attribute: .CenterY, relatedBy: .Equal, toItem: HeaderLabel, attribute: .CenterY, multiplier: 1, constant: CGFloat(offset))
            
            self.view.addConstraint(xConstraint)
            self.view.addConstraint(yConstraint)
            
            offset = offset + 48;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}