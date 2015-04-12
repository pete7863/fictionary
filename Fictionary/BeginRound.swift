//
//  BeginRound.swift
//  Fictionary
//
//  Created by Nicholas Peterson on 4/8/15.
//  Copyright (c) 2015 Nicholas Peterson. All rights reserved.
//

import Foundation
import UIKit

class BeginRound: UIViewController {
    
    @IBOutlet weak var DefinitionTextView: UITextView!
    @IBOutlet weak var SnigletTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "BeginRoundSegue"
        {
            BeginNewRound(DefinitionTextView.text)
            
            AddSniglet(Sniglet(Word: SnigletTextField.text))
        }
    }
    
}
