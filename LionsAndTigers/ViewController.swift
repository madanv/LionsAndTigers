//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Madan on 27/10/14.
//  Copyright (c) 2014 Madan Vetcha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImangeView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var myLions:[Lion] = []
    var myLionCubs:[LionCub] = []
    
    var currentIndex = 0
    
    var currentAnimal = (species: "Tiger", index:0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        myTiger.chuffNumberOfTimes(5, isLoud: false)
        
        println("My Tiger's name is: \(myTiger.name), its age is \(myTiger.age), its breed name is \(myTiger.breed) and its image is \(myTiger.image)")
        self.myImangeView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        self.myTigers.append(myTiger)
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "IndoChinese"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")

        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Siberian"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphamale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "mufasa"
        lion.subspecies = "WAfrica"
        lion.roar()
        lion.changeToAlphaMale()
        
        var lioness = Lion()
        lioness.age=3
        lioness.isAlphamale=false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "sarabi"
        lioness.subspecies = "Barbary"
        lioness.roar()
        
        self.myLions += [lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.name = "Simba"
        lionCub.subspecies = "Masai"
        println("Lion Cub should roar after this")
        lionCub.isMale = true
        lionCub.roar()
        lionCub.rubLionCubBelly()
        
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.name = "Nala"
        femaleLionCub.subspecies = "Transvaal"
        println("Lion Cub should roar after this")
        femaleLionCub.isMale = false

        self.myLionCubs += [lionCub, femaleLionCub]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateAnimal (){
        switch currentAnimal {
        case ("Tiger", _):
            var randomIndex = Int(arc4random_uniform(UInt32(myLions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            var randomIndex = Int(arc4random_uniform(UInt32(myLionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            var randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)

        }
    }
    
    func updateView(){
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            if(self.currentAnimal.species == "Tiger")
            {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImangeView.image = tiger.image
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age)"
                self.breedLabel.text = tiger.breed
                self.randomFactLabel.text = tiger.randomFact()
            }
            else if (self.currentAnimal.species == "Lion"){
                let lion = self.myLions[self.currentAnimal.index]
                self.myImangeView.image = lion.image
                self.nameLabel.text = lion.name
                self.ageLabel.text = "\(lion.age)"
                self.breedLabel.text = lion.subspecies
                self.randomFactLabel.text = lion.randomFact()
            }
            else if (self.currentAnimal.species == "LionCub"){
                let lionCub = self.myLionCubs[self.currentAnimal.index]
                self.myImangeView.image = lionCub.image
                self.nameLabel.text = lionCub.name
                self.ageLabel.text = "\(lionCub.age)"
                self.breedLabel.text = lionCub.subspecies
                self.randomFactLabel.text = lionCub.randomFact()
            }
            }, completion: {(finished: Bool) -> () in })

    }
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
}
    
    func updateTiger(){
        var randomIndex:Int
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while self.currentIndex == randomIndex
        
        self.currentIndex = randomIndex
        
        let tiger = self.myTigers[randomIndex]
        
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.myImangeView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            self.randomFactLabel.text = tiger.randomFact()
            
            }, completion: {(finished: Bool) -> () in })
    }
}

