//
//  ViewDetailCellController.swift
//  MyHabits
//
//  Created by Ekaterina Saveleva on 13.05.2023.
//

import UIKit

class ViewDetailCellController: UIViewController {
    
    private var isCheked = false
    
    private lazy var lablbeCityDeparture: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Город отправления  "
        title.font = .systemFont(ofSize: 16)
        title.textColor = .darkGray
        return title
    }()
    
    private lazy var lablbeNameOfCityDeparture: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Москва"
        title.font = .systemFont(ofSize: 20)
        title.textColor = .black
        return title
    }()
    
    private lazy var lablbeDateDeparture: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Дата отправления  "
        title.font = .systemFont(ofSize: 16)
        title.textColor = .darkGray
        return title
    }()
    
    private lazy var lablbeDateOfDeparture: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "15.04"
        title.font = .systemFont(ofSize: 20)
        title.textColor = .black
        return title
    }()
    
    private lazy var lablbeCityArrived: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Город прибытия  "
        title.font = .systemFont(ofSize: 16)
        title.textColor = .darkGray
        return title
    }()
    
    private lazy var lablbeNameOfCityArrived: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Санкт-Петербург"
        title.font = .systemFont(ofSize: 20)
        title.textColor = .black
        return title
    }()
    
    private lazy var lablbeDateArrived: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Дата возвращения"
        title.font = .systemFont(ofSize: 16)
        title.textColor = .darkGray
        return title
    }()
    
    private lazy var lablbeDateOfArrived: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "17.04"
        title.font = .systemFont(ofSize: 20)
        title.textColor = .black
        return title
    }()
    
    
    private lazy var costPerFlight: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "8 500 руб."
        title.font = .systemFont(ofSize: 40)
        title.textColor = .systemGreen
        return title
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        button.layer.borderColor = UIColor.green.cgColor
        button.sizeThatFits(CGSizeMake(100, 100)) // не работает
        button.addTarget(self, action: #selector(checkLikeAction), for: .touchUpInside)
        return button
    }()
    
    
    @objc private func checkLikeAction() {
        if self.isCheked {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            self.isCheked.toggle()
        } else {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            self.isCheked.toggle()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        layout()
        
    }
    
    func setupDetailView(_ cell: CustomCell) { // добавить данные
        self.costPerFlight.text = String(cell.cost)
    }
    
    private func layout() {
        view.addSubview(lablbeCityDeparture)
        view.addSubview(lablbeNameOfCityDeparture)
        view.addSubview(lablbeDateDeparture)
        view.addSubview(lablbeDateOfDeparture)
        view.addSubview(lablbeCityArrived)
        view.addSubview(lablbeNameOfCityArrived)
        view.addSubview(lablbeDateArrived)
        view.addSubview(lablbeDateOfArrived)
        view.addSubview(costPerFlight)
        view.addSubview(likeButton)
        
        NSLayoutConstraint.activate([
            
            lablbeCityDeparture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            lablbeCityDeparture.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 26),
            lablbeCityDeparture.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            
            
            lablbeNameOfCityDeparture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 37),
            lablbeNameOfCityDeparture.leadingAnchor.constraint(equalTo: lablbeCityDeparture.leadingAnchor, constant: 160),
            
            
            lablbeDateDeparture.topAnchor.constraint(equalTo: lablbeCityDeparture.topAnchor, constant: 50),
            lablbeDateDeparture.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 26),
            lablbeDateDeparture.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            
            lablbeDateOfDeparture.topAnchor.constraint(equalTo: lablbeNameOfCityDeparture.topAnchor, constant: 50),
            lablbeDateOfDeparture.leadingAnchor.constraint(equalTo: lablbeDateDeparture.leadingAnchor, constant: 160),
            
            
            lablbeCityArrived.topAnchor.constraint(equalTo: lablbeDateDeparture.topAnchor, constant: 100),
            lablbeCityArrived.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 26),
            lablbeCityArrived.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            
            
            lablbeNameOfCityArrived.topAnchor.constraint(equalTo: lablbeDateOfDeparture.topAnchor, constant: 100),
            lablbeNameOfCityArrived.leadingAnchor.constraint(equalTo: lablbeCityArrived.leadingAnchor, constant: 160),
            
            lablbeDateArrived.topAnchor.constraint(equalTo: lablbeCityArrived.topAnchor, constant: 50),
            lablbeDateArrived.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 26),
            lablbeDateArrived.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            
            lablbeDateOfArrived.topAnchor.constraint(equalTo: lablbeNameOfCityArrived.topAnchor, constant: 50),
            lablbeDateOfArrived.leadingAnchor.constraint(equalTo: lablbeDateDeparture.leadingAnchor, constant: 160),
            
            costPerFlight.topAnchor.constraint(equalTo: lablbeDateOfArrived.bottomAnchor, constant: 100),
            costPerFlight.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            
            likeButton.topAnchor.constraint(equalTo: costPerFlight.bottomAnchor, constant: 100),
            likeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 170)
        ])
    }
    
}
