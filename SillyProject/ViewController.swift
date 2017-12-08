//
//  ViewController.swift
//  SillyProject
//
//  Created by Viswanath Subramani S S on 22/07/17.
//  Copyright © 2017 Viswanath Subramani S S. All rights reserved.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}




let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortFormName(_ name: String) -> String {
    var name = name.lowercased()
    var shortName: String = "try"
    let vowels = CharacterSet.init(charactersIn: "aeiou")
    //for char in name.characters
    for char in name.unicodeScalars{
        //if let char = name.rangeOfCharacter(from: vowels)
        if vowels.contains(char) {
            shortName = name.substring(from: name.characters.index(of: Character(char))!)
            break
        }
        
    }
    
    return shortName
}


func lyricsForName(template: String, name: String) -> String{
    
    let SHORT_NAME = shortFormName(name)
    let lyrics = template
        .replacingOccurrences(of: "<FULL_NAME>", with: name)
        .replacingOccurrences(of: "<SHORT_NAME>", with: SHORT_NAME)
    
    return lyrics
    
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text=""
        lyricsView.text=""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if (nameField.text != ""){
            lyricsView.text = lyricsForName(template: bananaFanaTemplate, name: nameField.text!)
        }
    }
    
}

