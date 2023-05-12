//
//  HabitsCreateViewController.swift
//  MyHabits
//
//  Created by Ekaterina Saveleva on 24.04.2023.
//

import UIKit

class HabitsCreateViewController: UIViewController {
    
    var colorFromPicker: UIColor?
    
    private func makeBarItem() {
        let buttonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = buttonItem
    }
    @objc private func tapAction(){ // не понимаю куда должна вести кнопка, если прокто к сохранению, то не знаю как это офрмить
        let habit = Habit(name: textField.text ?? "", date: picker.date, color: self.colorFromPicker ?? .black)
        HabitsStore.shared.habits.append(habit)
        
    }

    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "НАЗВАНИЕ"
        return label
    }()
    
    private lazy var textField: UITextField = {
        let text = UITextField()
        text.textColor = .systemGray2
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Running morning"
        return text
    }()
    
    private lazy var labelColor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.text = "ЦВЕТ"
        return label
    }()

    private lazy var colorPicker: UIButton = {
        let button = UIButton()
       // button.setTitle("circle.fill", for: .normal)
        button.sizeToFit()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.tintColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(presentColorPicker), for: .touchUpInside)
        return button
    }()
    
    @objc private func presentColorPicker() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.title = "Background Color"
        colorPicker.supportsAlpha = false
        colorPicker.delegate = self
        colorPicker.modalPresentationStyle = .popover
        colorPicker.popoverPresentationController?.sourceItem = self.navigationItem.rightBarButtonItem
        self.present(colorPicker, animated: true)
        
    }
    
    private lazy var labelTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.text = "ВРЕМЯ"
        return label
    }()
    
    private lazy var labelTimePicker: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Каждый день в "
        label.textColor = .black
        
        return label
    }()

    private lazy var picker: UIDatePicker = {
        let picker = UIDatePicker()
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .time // чтобы выбрать обратный отсчет - выбираем .countDownTimer
        var oneYearTime = TimeInterval()
        oneYearTime = 365 * 24 * 60 * 60
        picker.tintColor = .magenta
        
        let todayDate = Date()
        
        let oneYearFromToday = todayDate
        let twoYearFromToday = todayDate.addingTimeInterval(2 * oneYearTime)
        
        picker.minimumDate = oneYearFromToday
        picker.maximumDate = twoYearFromToday
        picker.addTarget(self, action: #selector(datePickerChange(paramdatePicker:)), for: .valueChanged)
        return picker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        layout()
        makeBarItem()
    }
    
    @objc func datePickerChange(paramdatePicker: UIDatePicker) { //метод
        if paramdatePicker.isEqual(self.picker) {
            print("dateChange : = ", paramdatePicker.date)
        }
    }
    
    private func layout() {
        [
            labelName,
            textField,
            labelColor,
            colorPicker,
            labelTime,
            labelTimePicker,
            picker
        ].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            colorPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            colorPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),

            
            labelName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            labelName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            labelColor.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            labelColor.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            labelColor.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            labelTime.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            labelTime.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            labelTime.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            labelTimePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160),
            labelTimePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            labelTimePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            picker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 140),
            //picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
}

extension HabitsCreateViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        self.colorFromPicker = color
        self.colorPicker.tintColor = color
    }
}
