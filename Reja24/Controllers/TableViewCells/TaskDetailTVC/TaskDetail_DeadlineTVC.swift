//
//  TaskDetail_DeadlineTVC.swift
//  Reja24
//
//  Created by Sarvar Qosimov on 01/05/24.
//

import UIKit

class TaskDetail_DeadlineTVC: TaskDetailBaseTVC {
    
    let datePicker = UIDatePicker()
    
    init(_ taskTime: String) {
        super.init()
        
        initViews()
        setupDatePicker(taskTime)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initViews(){
        containerView.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.isEnabled = false
        datePicker.datePickerMode = .dateAndTime
        datePicker.backgroundColor = .clear
        datePicker.layer.cornerRadius = 10
        datePicker.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            datePicker.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            datePicker.heightAnchor.constraint(equalToConstant: 45),
            datePicker.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            datePicker.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
        ])
    }
    
    func setupDatePicker(_ taskTime: String) {
        var dateComponents = DateComponents()
        var yearString     = ""
        var monthString    = ""
        var dayString      = ""
        var hourString     = ""
        var minuteString   = ""
        
        for i in taskTime.enumerated() {
            if i.offset < 4 {
                yearString.append(i.element)
            } else if i.offset == 5 || i.offset == 6 {
                monthString.append(i.element)
            } else if i.offset == 8 || i.offset == 9 {
                dayString.append(i.element)
            } else if i.offset == 14 || i.offset == 15 {
                hourString.append(i.element)
            } else if i.offset == 17 || i.offset == 18 {
                minuteString.append(i.element)
            }
        }
        
        dateComponents.year = Int(yearString)
        dateComponents.month = Int(monthString)
        dateComponents.day = Int(dayString)
        dateComponents.hour = Int(hourString)
        dateComponents.minute = Int(minuteString)
        
        if let customDate = Calendar.current.date(from: dateComponents) {
            datePicker.date = customDate
        } else {
            print("error")
        }
    }

    
    
}
