//
//  CustomTableViewCell.swift
//  MyHabits
//
//  Created by Ekaterina Saveleva on 13.05.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private var isCheked: Bool?
    private var idCell: UUID!
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.text = "8 500 руб"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .boldSystemFont(ofSize: 25)
        title.textColor = .systemGreen
        return title
    }()

    private lazy var lablbeMoscowSpb: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Москва - Санкт-Петербург"
        title.font = .systemFont(ofSize: 16)
        title.textColor = .darkGray
        return title
    }()
    
    private lazy var lablbeSpbMoscow: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Санкт-Петербург - Москва"
        title.font = .systemFont(ofSize: 16)
        title.textColor = .darkGray
        return title
    }()
    
    private lazy var departureData: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "15.06"
        title.font = .systemFont(ofSize: 16)
        title.textColor = .darkGray
        return title
    }()
    
    private lazy var arrivedData: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "17.06"
        title.font = .systemFont(ofSize: 16)
        title.textColor = .darkGray
        return title
    }()
    
    private lazy var arrowLeft: UIImageView = {
        var image = UIImageView(image: UIImage(systemName: "arrowshape.left.fill"))
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private lazy var arrowRight: UIImageView = {
        var image = UIImageView(image: UIImage(systemName: "arrowshape.right.fill"))
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        button.layer.borderColor = UIColor.green.cgColor
        button.addTarget(self, action: #selector(checkLikeAction), for: .touchUpInside)
        return button
    }()

    
    @objc private func checkLikeAction() {
        if self.isCheked ?? false {
            checkButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            self.isCheked?.toggle()
        } else {
            checkButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            self.isCheked?.toggle()
        }
        
       
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ cell: CustomCell) {
        self.lablbeMoscowSpb.text = cell.cityArravived
        self.departureData.text = cell.dateLeave
        self.lablbeSpbMoscow.text = cell.cityLeaved
        self.arrivedData.text = cell.dateArrived
        self.title.text = String(cell.cost)
        //self.checkButton.isSelected = cell.isLike
        self.isCheked = cell.isLike
        self.checkButton.setImage(UIImage(systemName: cell.isLike ? "hand.thumbsup.fill" : "hand.thumbsup"), for: .normal)
        self.idCell = cell.id
    }
    
    
    private func layout() {
        [title, lablbeMoscowSpb, departureData, arrivedData, lablbeSpbMoscow, arrowLeft, arrowRight, checkButton ].forEach({contentView.addSubview($0)})
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 ),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -screenWidth*0.3),
            
            lablbeSpbMoscow.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 70),
            lablbeSpbMoscow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            lablbeSpbMoscow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -screenWidth*0.3),
            lablbeSpbMoscow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            lablbeMoscowSpb.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 30),
            lablbeMoscowSpb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            lablbeMoscowSpb.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -screenWidth*0.3),
            
            arrowRight.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            arrowRight.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 70),
            
            arrowLeft.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 50),
            arrowLeft.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 70),
            
            departureData.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            departureData.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            departureData.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -screenWidth*0.3),
            
            arrivedData.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 50),
            arrivedData.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            
            checkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            checkButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            
        ])
    }

}
