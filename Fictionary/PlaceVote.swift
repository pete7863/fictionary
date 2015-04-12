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

class PlaceVote: UIViewController {
    
    @IBOutlet weak var PlaceVoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sniglets = GetSniglets()
        
        var offset = 40
        for var i = 0; i < sniglets.count ; i++
        {
            var nameField: UILabel = UILabel(frame: CGRectZero);
            self.view.addSubview(nameField)
            nameField.text = sniglets[i].Word
            nameField.textColor = UIColor.whiteColor()
            nameField.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            let widthConstraint = NSLayoutConstraint(item: nameField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 200)
            let heightConstraint = NSLayoutConstraint(item: nameField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 36)
            
            nameField.addConstraint(widthConstraint)
            nameField.addConstraint(heightConstraint)
            
            let xConstraint = NSLayoutConstraint(item: nameField, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
            let yConstraint = NSLayoutConstraint(item: nameField, attribute: .CenterY, relatedBy: .Equal, toItem: PlaceVoteLabel, attribute: .CenterY, multiplier: 1, constant: CGFloat(offset))
            
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

