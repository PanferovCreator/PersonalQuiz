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
        navigationItem.setHidesBackButton(true, animated: false)
        
        updateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}

extension ResultViewController {
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answerChosen.map { $0.animal}
        
        for animal in animals {
            frequencyOfAnimals[animal, default: 0] += 1
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        resultIconLabel.text = "Вы - \(animal.rawValue)!"
        resultLabel.text = animal.definition
    }
}
    

