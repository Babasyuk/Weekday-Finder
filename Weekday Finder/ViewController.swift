//
//  ViewController.swift
//  Weekday Finder
//
//  Created by Артём on 07.01.2022.
//  Copyright © 2022 Артём Бабасюк. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        let calendar = Calendar.current // определяю нужный календарь - текущий, а не календарь майя
        var dateComponents = DateComponents() // определяю чо у календаря должны быть компоненты
        dateComponents.day = Int(day) // передаю данное свойство в нужный Text Field
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        let dateFormatter = DateFormatter() // определяю формат
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "EEEE" // определяю формат
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let weekday =  dateFormatter.string(from: date) // определяю день недели
        let capitalizedWeekday = weekday.capitalized
        resultLabel.text = capitalizedWeekday // меняю текст в Label
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // функция "Закончили редактировать"
    } // делаю так чтобы клавиаура пропадала если тыкаю в пустые маста на экране
    
}

