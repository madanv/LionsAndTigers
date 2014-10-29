//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Madan on 28/10/14.
//  Copyright (c) 2014 Madan Vetcha. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphamale = false
    var image = UIImage(named:"")
    var name = ""
    var subspecies = ""
    
    func roar(){
        println("roar roar")
    }
    
    func changeToAlphaMale() {
        self.isAlphamale = true
    }
    
    func randomFact () -> String {
        var randomFact:String
        
        if(self.isAlphamale == true){
            randomFact = "This is a male Lion"
        }
        else
        {
            randomFact = "This is a female Lion"
        }
        return randomFact
    }
}