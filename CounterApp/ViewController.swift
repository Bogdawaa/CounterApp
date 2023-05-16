//
//  ViewController.swift
//  CounterApp
//
//  Created by Bogdan Fartdinov on 15.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterChangeLog: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    
    private var counter: Int = 0
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Обновление счетчика нажатий
        updateCounter()
        counterChangeLog.text = "История измененй:\n"
        
        
    }
    //MARK: - настройки счетчика и даты
    private func updateCounter() {
        countLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func setupDate() -> String {
        let dateFormatter = DateFormatter()
        let date = Date.now
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return (dateFormatter.string(from: date))
    }
    
    
    //MARK: - Обработчики событий
    @IBAction func decreaseButtonTapped(_ sender: UIButton) {
        let date = setupDate()
        if counter > 0 {
            counter -= 1
            updateCounter()
            counterChangeLog.text.append("\(date) значение изменено на -1\n")
        } else {
            counterChangeLog.text.append("\(date) попытка уменьшить значение счётчика ниже 0\n")
        }
    }
    
    @IBAction func encreaseButtonTapped(_ sender: UIButton) {
        let date = setupDate()
        counter += 1
        updateCounter()
        counterChangeLog.text.append("\(date) значение изменено на +1\n")
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        let date = setupDate()
        counter = 0
        updateCounter()
        counterChangeLog.text.append("\(date) значение сброшено\n")
    }
}

