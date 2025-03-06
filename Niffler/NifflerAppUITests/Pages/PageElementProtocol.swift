//
//  PageElementProtocok.swift
//  NifflerAppUITests
//
//  Created by Борис Лысиков on 01.03.2025.
//

import XCTest

protocol NavigationBar {
    var navigationBarBackButton: XCUIElement { get }
    func tapNavigationBarBackButton()
}

// Этот код добавляет расширение (extension) для NavigationBar, но только для тех классов, которые наследуются от BasePage.
extension NavigationBar where Self: BasePage {
    var navigationBarBackButton: XCUIElement {
        app.navigationBars.buttons["Back"]
    }
    
    func tapNavigationBarBackButton() {
        navigationBarBackButton.tap()
    }
}
