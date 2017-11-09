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
        NotificationCenter.default.addObserver(self, selector: #selector(self.calendarDayDidChange), name:NSNotification.Name.NSCalendarDayChanged, object:nil)

        statusItem.title = "RomanBar"
        statusItem.menu = statusMenu

        updateDate()
    }

    @IBAction func quitAction(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }

    func updateDate() {
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
    }

    @objc func calendarDayDidChange(notification: NSNotification) {
        DispatchQueue.main.async { // Correct
            self.updateDate()
        }
    }

}
