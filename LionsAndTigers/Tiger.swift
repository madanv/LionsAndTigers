//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Madan on 27/10/14.
//  Copyright (c) 2014 Madan Vetcha. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    
    func chuff() {
        println("Tiger: Chuff Chuff")
    }
    
    func chuffNumberOfTimes(numberOfTimes: Int){
        for var chuff = 0; chuff < numberOfTimes; chuff++ {
            self.chuff()
        }
    }
    
    func chuffNumberOfTimes (numberOfTimes: Int, isLoud: Bool) {
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud {
                chuff()
            }
            else {
                println("Tiger: Per Per")
            }
        }
    }
    
    func ageInTigerYearsFromAge (regularAge: Int) -> Int {
        let newAge = regularAge * 3
        return newAge        
    }
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        
        var randomFactString:String
        
        if randomNumber == 0 {
            randomFactString = "The tiger is the Biggest Species in the Cat Family"
        }
        else if randomNumber == 0 {
            randomFactString = "Tiger can reach a length of 3.3 meters"
        }
        else {
            randomFactString = "A group of Tigers is known as an 'ambush' or 'streak'"
        }
        return randomFactString
    }
}
