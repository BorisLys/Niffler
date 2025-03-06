//
//  XCUIElement+Extension.swift
//  Niffler
//
//  Created by Борис Лысиков on 02.03.2025.
//

import XCTest

extension XCUIElement {
    
    func tapElement() {
        waitForHittable()
        tap()
    }
}
