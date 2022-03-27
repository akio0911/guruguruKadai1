//
//  ViewController.swift
//  challenge_1
//
//  Created by 森本拓未 on 2022/03/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    let numberOfInput = 5
    var inputNumbers: [Int] = []

    @IBOutlet private weak var inputTextTableView: UITableView!
    @IBOutlet private weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNumbers = Array(repeating: 0, count: numberOfInput)
        inputTextTableView.dataSource = self
    }
    @IBAction private func calculateSum(_ sender: Any) {
        let resultNumber = inputNumbers
            .reduce(0) { $0 + $1 }
        resultLabel.text = String(resultNumber)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfInput
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InputLabelCell", for: indexPath)
                as? InputLabelCell else {
            return UITableViewCell()
        }
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
}

extension ViewController: InputLabelCellDelegate {
    func updateText(text: String?, index: Int) {
        let number = Int(text ?? "0") ?? 0
        print(number)
        inputNumbers[index] = number
    }
}
