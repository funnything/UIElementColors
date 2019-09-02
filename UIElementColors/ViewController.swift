//
//  ViewController.swift
//  UIElementColors
//
//  Created by Yosaku Toyama on 2019/08/29.
//  Copyright © 2019 Yosaku Toyama. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let colors: [(color: UIColor, name: String)] = [
        (.label, "label"),
        (.secondaryLabel, "secondaryLabel"),
        (.tertiaryLabel, "tertiaryLabel"),
        (.quaternaryLabel, "quaternaryLabel"),
        (.systemFill, "systemFill"),
        (.secondarySystemFill, "secondarySystemFill"),
        (.tertiarySystemFill, "tertiarySystemFill"),
        (.quaternarySystemFill, "quaternarySystemFill"),
        (.placeholderText, "placeholderText"),
        (.systemBackground, "systemBackground"),
        (.secondarySystemBackground, "secondarySystemBackground"),
        (.tertiarySystemBackground, "tertiarySystemBackground"),
        (.systemGroupedBackground, "systemGroupedBackground"),
        (.secondarySystemGroupedBackground, "secondarySystemGroupedBackground"),
        (.tertiarySystemGroupedBackground, "tertiarySystemGroupedBackground"),
        (.separator, "separator"),
        (.opaqueSeparator, "opaqueSeparator"),
        (.link, "link"),
        (.darkText, "darkText"),
        (.lightText, "lightText")
    ]

    @IBAction func toggle(_ sender: Any) {
        var vc: UIViewController = self
        while let parent = vc.parent {
            vc = parent
        }

        vc.overrideUserInterfaceStyle = vc.overrideUserInterfaceStyle == .dark ? .light : .dark
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colors[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        cell.canvas.backgroundColor = color.color
        cell.nameLabel.text = color.name
        cell.codeLabel.text = "\(color.color.hex) \(color.color.premultipliedHex)"
        return cell
    }
}

class Cell: UITableViewCell {
    @IBOutlet weak var canvas: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
}

extension UIColor {
    var hex: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)

        if a == 1 {
            return String(format: "#%02X%02X%02X", (r * 255).rounding, (g * 255).rounding, (b * 255).rounding)
        } else {
            return String(format: "(%g)#%02X%02X%02X", a, (r * 255).rounding, (g * 255).rounding, (b * 255).rounding)
        }
    }

    var premultipliedHex: String {
        var a: CGFloat = 0
        getRed(nil, green: nil, blue: nil, alpha: &a)

        return interpolate(with: .systemBackground, ratio: 1 - a).withAlphaComponent(1).hex
    }

    func interpolate(with color: UIColor, ratio: CGFloat) -> UIColor {
        var srcRed: CGFloat = 0
        var srcGreen: CGFloat = 0
        var srcBlue: CGFloat = 0
        var srcAlpha: CGFloat = 0
        getRed(&srcRed, green: &srcGreen, blue: &srcBlue, alpha: &srcAlpha)

        var dstRed: CGFloat = 0
        var dstGreen: CGFloat = 0
        var dstBlue: CGFloat = 0
        var dstAlpha: CGFloat = 0
        color.getRed(&dstRed, green: &dstGreen, blue: &dstBlue, alpha: &dstAlpha)

        return UIColor(
            red: srcRed + (dstRed - srcRed) * ratio,
            green: srcGreen + (dstGreen - srcGreen) * ratio,
            blue: srcBlue + (dstBlue - srcBlue) * ratio,
            alpha: srcAlpha + (dstAlpha - srcAlpha) * ratio
        )
    }
}

extension CGFloat {
    var rounding: Int {
        return Int(exactly: rounded())!
    }
}
