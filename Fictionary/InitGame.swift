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
    
    var arrayOfTextFields:[UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var height = 132;
        for var i = 1; i <= 8 ; i++
        {
            var myTextField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200.00, height: 36.00));
            myTextField.center = CGPointMake(UIScreen.mainScreen().bounds.width/2, CGFloat(height))
            myTextField.placeholder = "Player \(i)"
            myTextField.backgroundColor = UIColor.whiteColor()
            myTextField.borderStyle = UITextBorderStyle.RoundedRect
            myTextField.addTarget(self, action: "nameEntered:", forControlEvents: UIControlEvents.EditingChanged)
            myTextField.addTarget(self, action: "textFieldDidBeginEditing:", forControlEvents: UIControlEvents.EditingDidBegin)
            myTextField.addTarget(self, action: "textFieldDidEndEditing:", forControlEvents: UIControlEvents.EditingDidEnd)
            if(i != 1)
            {
                myTextField.hidden = true
            }
            height = height + 48;
            self.arrayOfTextFields.append(myTextField)
            self.view.addSubview(myTextField)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func nameEntered(sender: UITextField!) {
        var i = 0
        
        for i = 0; i <= 7; i++
        {
            if(arrayOfTextFields[i] == sender)
            {
                break
            }
        }
        
        if(sender.text == "")
        {
            for var j = 7; j > i; j--
            {
                arrayOfTextFields[j].hidden = true
            }
        }
        else
        {
            if(i < 7)
            {
                arrayOfTextFields[i+1].hidden = false
            }
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
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
    
}