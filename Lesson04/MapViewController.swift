//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var keyValueTableView: UITableView!
    @IBOutlet weak var keyText: UITextField!
    @IBOutlet weak var valueText: UITextField!
    var placeholderCell = "keyValueCell"
    var keyValueDictionary = [String: String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        keyText.delegate = self
        valueText.delegate = self
        keyValueDictionary = [keyText.text: valueText.text]
        keyValueTableView.delegate = self
        if keyValueDictionary == true {
            keyValueTableView.dataSource = toString(keyValueDictionary)
        }
        
        /*
        TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
        TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
        TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
        */
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyValueDictionary.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dictionaryCell = tableView.dequeueReusableCellWithIdentifier(placeholderCell, forIndexPath: NSIndexPath) {
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        valueText.resignFirstResponder()
        if valueText.text != "" {
            myData.append(textField.text)
        } else {
            return false
        }
        self.keyValueTableView.reloadData()
        valueText.text = ""
        return true
    }

    
    
}
