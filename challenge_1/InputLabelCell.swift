//
//  InputLabelCell.swift
//  challenge_1
//
//  Created by 森本拓未 on 2022/03/24.
//

import Foundation
import UIKit

class InputLabelCell: UITableViewCell, UITextFieldDelegate {
    static let cellHeight = 45
    weak var delegate: InputLabelCellDelegate?
    var index = 0
    @IBAction private func updateTextWhenEditingChanged(_ sender: UITextField) {
        print(0)
        delegate?.updateText(text: sender.text, index: index)
    }
}

protocol InputLabelCellDelegate: AnyObject {
    func updateText(text: String?, index: Int)
}
