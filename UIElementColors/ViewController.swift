//
//  ViewController.swift
//  UIElementColors
//
//  Created by Yosaku Toyama on 2019/08/29.
//  Copyright © 2019 Yosaku Toyama. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let colors: [UIColor] = [
        .label,
        .secondaryLabel,
        .tertiaryLabel,
        .quaternaryLabel,
        .systemFill,
        .secondarySystemFill,
        .tertiarySystemFill,
        .quaternarySystemFill,
        .placeholderText,
        .systemBackground,
        .secondarySystemBackground,
        .tertiarySystemBackground,
        .systemGroupedBackground,
        .secondarySystemGroupedBackground,
        .tertiarySystemGroupedBackground,
        .separator,
        .opaqueSeparator,
        .link,
        .darkText,
        .lightText
    ]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 64
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        cell.label.text = "okipu \(indexPath)"
        return cell
    }
}

class Cell: UITableViewCell {
    @IBOutlet weak var canvas: UIView!
    @IBOutlet weak var label: UILabel!
}
