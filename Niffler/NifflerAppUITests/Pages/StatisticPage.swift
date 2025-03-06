//
//  StatisticPage.swift
//  NifflerAppUITests
//
//  Created by Борис Лысиков on 04.03.2025.
//

import XCTest
import NifflerApp

final class StatisticPage: BasePage, NavigationBar {
    
    typealias IDs = StatisticViewIDs
    
    // MARK: - Locators
    
    private var statisticText: XCUIElement {
        app.staticTexts[IDs.statisticText.rawValue]
    }
    
    // MARK: - Verify
    
    @discardableResult
    func verifyStatisticText(_ text: String,
                             file: StaticString = #file,
                             line: UInt = #line) -> Self {
        XCTContext.runActivity(named: "Проверяем заголовок: \(text)") { _ in
            statisticText.verifyLabel(equal: text)
        }
        return self
    }
    
}
