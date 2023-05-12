//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Ekaterina Saveleva on 17.04.2023.
//

import UIKit

class HabitsViewController: UIViewController {

            private lazy var plusButton: UIBarButtonItem = {
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(performPlusButton))
        plusButton.width = 0
                plusButton.tintColor = UIColor(red: 161, green: 22, blue: 204, alpha: 0)
        return plusButton
         }()
        private lazy var tableHabits: UITableView = {
        let table = UITableView(frame: .zero , style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.separatorInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        table.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.identifier)
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return table
        }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = plusButton
        layout()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableHabits.reloadData()
    }

    @objc func performPlusButton() {
        let infoVC = HabitsCreateViewController()
        navigationController?.navigationBar.prefersLargeTitles = false
        infoVC.title = "Создать"
        navigationController?.pushViewController(infoVC, animated: true)

    }


    private func layout() {
        view.addSubview(tableHabits)

        NSLayoutConstraint.activate([



            tableHabits.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableHabits.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableHabits.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableHabits.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }
}


//// MARK: - UITableViewDelegate

extension HabitsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 0 ? UITableView.automaticDimension : 130
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = HabitDetailsViewController()
        detail.title = "Detail \(indexPath.row)"
        navigationController?.pushViewController(HabitDetailsViewController(), animated: true)
    }
}

//// MARK: - UITableViewDataSource

extension HabitsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.habits.count + 1
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as? HeaderTableViewCell else {return UITableViewCell()}
            cell.selectionStyle = .none

            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell else {return UITableViewCell()}
            cell.selectionStyle = .none
//            cell.setCell(HabitsStore.shared.habits[indexPath.row - 1])

            return cell
        }
    }
}




