//
//  newTest.swift
//  NifflerUITests
//
//  Created by Борис Лысиков on 01.03.2025.
//

import XCTest

final class newTest: XCTestCase {
    
    let app = XCUIApplication() // отдельная программа, которая устанавливается на симулятор.
    
    func testLogin() {
        app.launch()
        
        app.textFields["userNameTextField"].tap()
        app.textFields["userNameTextField"].typeText("stage")
        app.children(matching: .button)
        
        app.secureTextFields["passwordTextField"].tap()
        app.secureTextFields["passwordTextField"].typeText("12345")
        
        app.buttons["loginButton"].tap()
        
        let _ = app.scrollViews.firstMatch.waitForExistence(timeout: 10)
        XCTAssertGreaterThanOrEqual(app.scrollViews.count, 1)
    }
}
