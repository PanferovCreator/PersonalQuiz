//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Dmitriy Panferov on 20/02/23.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultIconLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var answerChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let animalsFromAnswers = getAnimalsFromAnswers(answerChosen)
        let favoriteAnimal = getFavoritesAnimal(animalsFromAnswers)
        
        resultIconLabel.text = "Вы - \(favoriteAnimal.rawValue)"
        resultLabel.text = favoriteAnimal.definition
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getAnimalsFromAnswers(_ answers: [Answer]) -> [Animal] {
        return answers.map { $0.animal }
    }
    
    private func getFavoritesAnimal(_ animals: [Animal]) -> Animal {
        
        var favoriteAnimals: [Animal] = []
        
        var dog: [Animal] = []
        var cat: [Animal] = []
        var rabbit: [Animal] = []
        var turtle: [Animal] = []
        
        for animal in animals {
            switch animal {
            case Animal.dog:
                dog.append(animal)
            case Animal.cat:
                cat.append(animal)
            case Animal.rabbit:
                rabbit.append(animal)
            default:
                turtle.append(animal)
            }
        }
        
        if dog.count >= cat.count && dog.count >= rabbit.count && dog.count >= turtle.count {
            favoriteAnimals += dog
        } else if cat.count >= dog.count && cat.count >= rabbit.count && cat.count >= turtle.count {
            favoriteAnimals += cat
        } else if rabbit.count >= dog.count && rabbit.count >= cat.count && rabbit.count >= turtle.count {
            favoriteAnimals += rabbit
        } else {
            favoriteAnimals += turtle
        }
        
        let favoriteAnimal = favoriteAnimals.removeFirst()
        return favoriteAnimal
    }
}
    
