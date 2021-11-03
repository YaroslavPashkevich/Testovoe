//
//  MyCell.swift
//  Testovoe
//
//  Created by  Yaroslav on 31.10.21.
//

import Foundation
import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func update(with text: String) {
        titleLabel.text = text
    }
}
