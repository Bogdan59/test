//
//  AddRecordVC.swift
//  G57L12
//
//  Created by Ivan Vasilevich on 11/2/17.
//  Copyright © 2017 RockSoft. All rights reserved.
//

import UIKit
import Parse

class AddRecordVC: UIViewController {

	@IBOutlet weak var textField: UITextField!
	
	@IBAction func saveRecord() {
		let object = PFObject(className: "Quote")
		object["text"] = textField.text!
		object["authorName"] = "Dima"
		object.saveEventually { (success, error) in
			if success {
				self.textField.text = nil
			}
		}
		
		
	}
	
}
