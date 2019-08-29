//
//  ViewController.swift
//  UIElementColors
//
//  Created by Yosaku Toyama on 2019/08/29.
//  Copyright © 2019 Yosaku Toyama. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    override func loadView() {
        super.loadView()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 64
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "okipu \(indexPath)"
        return cell
    }
}
