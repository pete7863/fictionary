//
//  EnterSubmission.swift
//  Fictionary
//
//  Created by Nicholas Peterson on 4/12/15.
//  Copyright (c) 2015 Nicholas Peterson. All rights reserved.
//

import Foundation
import UIKit

class EnterSubmission: UIViewController {

    @IBOutlet weak var DefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DefinitionLabel.text = GetCurrentDefinition()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
}