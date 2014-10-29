//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Madan on 28/10/14.
//  Copyright (c) 2014 Madan Vetcha. All rights reserved.
//

import Foundation

class LionCub: Lion {
    
    var isMale = false
    
    func rubLionCubBelly(){
        println("Lion Cub rub rub")
    }
    
    override func roar() {
        super.roar()
        println("Cub Crowl Crowl")
    }
    
    override func randomFact() -> String {
        var randomFactString:String
        if isMale {
            randomFactString = "Male pub"
        }
        else {
            randomFactString = "Female Cub"
        }
        return randomFactString
    }
}