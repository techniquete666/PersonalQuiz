//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var finalAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        resultLabel.text = "Вы - \(chooseAnAnimal().rawValue)"
        descriptionLabel.text = (chooseAnAnimal().definition)
        
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }

    private func chooseAnAnimal() -> Animal {
        let animals = finalAnswers.map { $0.animal }
        let animalsCount = animals.reduce(into: [:]) {
            counts, animal in counts[animal, default: 0] += 1 }
        let sortedAnimals = animalsCount.sorted(by: { $0.value > $1.value })
        let neededAnimal = sortedAnimals.first?.key ?? Animal.turtle
        return neededAnimal
    }
}
