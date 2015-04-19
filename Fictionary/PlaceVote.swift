//
//  PlaceVote.swift
//  Fictionary
//
//  Created by Nicholas Peterson on 4/12/15.
//  Copyright (c) 2015 Nicholas Peterson. All rights reserved.
//

import Foundation
import UIKit

var sniglets: [Sniglet] = []
var currentPlayer:Player = GetCurrentPlayer()
var snigletBtns: [UIButton] = []

class PlaceVote: UIViewController {
    
    @IBOutlet weak var HeaderLabel: UILabel!
    @IBOutlet weak var PlaceVoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentPlayer = GetCurrentPlayer()
        HeaderLabel.text = currentPlayer.name
        sniglets = GetSniglets()
        snigletBtns.removeAll()
        
        var offset = 40
        for var i = 0; i < sniglets.count ; i++
        {
            var snigletBtn: UIButton = UIButton(frame: CGRectZero);
            self.view.addSubview(snigletBtn)
            snigletBtn.setTitle("\(sniglets[i].word) - \(sniglets[i].guessesReceived)", forState: UIControlState.Normal)
            snigletBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            snigletBtn.titleLabel?.textAlignment = NSTextAlignment.Center
            snigletBtn.backgroundColor = UIColor.redColor()
            snigletBtn.addTarget(self, action: "processVote:", forControlEvents: UIControlEvents.TouchUpInside)
            snigletBtn.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            let widthConstraint = NSLayoutConstraint(item: snigletBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 200)
            let heightConstraint = NSLayoutConstraint(item: snigletBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 36)
            
            snigletBtn.addConstraint(widthConstraint)
            snigletBtn.addConstraint(heightConstraint)
            
            let xConstraint = NSLayoutConstraint(item: snigletBtn, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
            let yConstraint = NSLayoutConstraint(item: snigletBtn, attribute: .CenterY, relatedBy: .Equal, toItem: PlaceVoteLabel, attribute: .CenterY, multiplier: 1, constant: CGFloat(offset))
            
            self.view.addConstraint(xConstraint)
            self.view.addConstraint(yConstraint)
            snigletBtns.append(snigletBtn)
            
            offset = offset + 48;
        }
    }
    
    func processVote(button: UIButton) {
        for var i = 0; i < snigletBtns.count; i++
        {
            //TODO: how do we handle duplicate sniglets?
            if(snigletBtns[i] == button)
            {
                GuessSniglet(sniglets[i], currentPlayer.id)
                break;
            }
        }
        
        IncrementPlayer()
        
        if(CurrentPlayerID == GetModeratorID())
        {
            //Increment so a different player starts the next round TODO: handle in Game
            IncrementPlayer()
            
            self.performSegueWithIdentifier("ShowScoreboard", sender: button)
        }
        else
        {
            //Move to next view of page
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("PlaceVote") as! UIViewController
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

