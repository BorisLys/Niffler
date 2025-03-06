//
//  PageFactory.swift
//  NifflerAppUITests
//
//  Created by Борис Лысиков on 01.03.2025.
//

import XCTest

// Simple
class PageFactory {
    init(app: XCUIApplication) {
        self.app = app
    }
    
    let app: XCUIApplication

    func loginPage() -> LoginPage {
        return LoginPage(app: app)
    }
    
    func statisticPage() -> StatisticPage {
        return StatisticPage(app: app)
    }
}
