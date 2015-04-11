//
//  InitGame.swift
//  Fictionary
//
//  Created by Nicholas Peterson on 4/7/15.
//  Copyright (c) 2015 Nicholas Peterson. All rights reserved.
//

import Foundation
import UIKit

class InitGame: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var EnterNameLabel: UILabel!
    @IBOutlet weak var BeginGame: UIButton!
    
    var nameArray:[UITextField] = []
    var deleteArray:[UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create player name textfields
        var offset = 40
        for var i = 1; i <= MAX_NUM_PLAYERS ; i++
        {
            var nameField: UITextField = UITextField(frame: CGRectZero);
            self.view.addSubview(nameField)
            nameField.placeholder = "Player \(i)"
            nameField.backgroundColor = UIColor.whiteColor()
            nameField.borderStyle = UITextBorderStyle.RoundedRect
            nameField.addTarget(self, action: "nameEntered:", forControlEvents: UIControlEvents.EditingChanged)
            nameField.addTarget(self, action: "textFieldDidBeginEditing:", forControlEvents: UIControlEvents.EditingDidBegin)
            nameField.addTarget(self, action: "textFieldDidEndEditing:", forControlEvents: UIControlEvents.EditingDidEnd)
            nameField.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            let widthConstraint = NSLayoutConstraint(item: nameField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 200)
            let heightConstraint = NSLayoutConstraint(item: nameField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 36)
            
            nameField.addConstraint(widthConstraint)
            nameField.addConstraint(heightConstraint)
            
            let xConstraint = NSLayoutConstraint(item: nameField, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
            let yConstraint = NSLayoutConstraint(item: nameField, attribute: .CenterY, relatedBy: .Equal, toItem: EnterNameLabel, attribute: .CenterY, multiplier: 1, constant: CGFloat(offset))
            
            self.view.addConstraint(xConstraint)
            self.view.addConstraint(yConstraint)
            
            if(i > 1) //Hide all but the first
            {
                nameField.hidden = true
            }
            offset = offset + 48;
            self.nameArray.append(nameField)
        }
        
        //TODO: Hide begin button
        BeginGame.hidden = false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func nameEntered(sender: UITextField!) {
        var player = 0
        
        //Determine which textfield got us here
        for player = 0; player <= MAX_NUM_PLAYERS - 1; player++
        {
            if(nameArray[player] == sender)
            {
                break
            }
        }
        
        if(sender.text == "")
        {
            for var i = MAX_NUM_PLAYERS - 1; i > player; i-- //Hide entries after
            {
                nameArray[i].hidden = true
            }
        }
        else
        {
            if(player < MAX_NUM_PLAYERS-1) //Show entries below
            {
                nameArray[player+1].hidden = false
            }
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if(textField.center.y > 340)
        {
            animateViewMoving(true, moveValue: textField.center.y - 340)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if(textField.center.y > 340)
        {
            animateViewMoving(false, moveValue: textField.center.y - 340)
        }
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        var movementDuration:NSTimeInterval = 0.3
        var movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "BeginGameSegue"
        {
            for var i = 0; i < MAX_NUM_PLAYERS; i++
            {
                if(nameArray[i].text != "")
                {
                    AddNewPlayer(nameArray[i].text)
                }
            }
        }
    }
    
}