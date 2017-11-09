//
//  StatusMenuController.swift
//  RomanBar
//
//  Created by Robert Clarke on 09/11/2017.
//  Copyright © 2017 Robert Clarke. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {

    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    override func awakeFromNib() {
        let date = Date()

        let parts = date.dateInRoman()
        var dateComponents: [String] = []

        let dateOrder = Locale.current.dateOrder()

        if dateOrder == .dayFirst {
            dateComponents = [parts.day, parts.month, parts.year]
        } else {
            dateComponents = [parts.month, parts.day, parts.year]
        }

        let separatorSymbol =  "-"
        let text = dateComponents.joined(separator: separatorSymbol)

        statusItem.title = text
        statusItem.menu = statusMenu
    }

    @IBAction func quitAction(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }

}
