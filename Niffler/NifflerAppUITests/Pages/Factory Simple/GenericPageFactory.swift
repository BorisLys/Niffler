//
//  GenericPageFactory.swift
//  NifflerAppUITests
//
//  Created by Борис Лысиков on 01.03.2025.
//

import XCTest

class PageObjectsFactory {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func create<T: BasePage>(_ type: T.Type) -> T {
        return T(app: app)
    }
}

// Использование:
let factory = PageObjectsFactory(app: XCUIApplication())
let loginPage = factory.create(LoginPage.self)
