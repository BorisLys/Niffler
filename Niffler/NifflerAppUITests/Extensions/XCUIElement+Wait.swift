//
//  XCUIElement+Wait.swift
//  NifflerAppUITests
//
//  Created by Борис Лысиков on 05.03.2025.
//

import XCTest

extension XCUIElement {
    
    func waitForHittable(timeout: TimeInterval = 5,
                      file: StaticString = #file,
                      line: UInt = #line
    ) {
        let result = wait(for: \.isHittable, toEqual: true, timeout: timeout)
        XCTAssert(result,
                  "Элемент отсутвует на экране",
                  file: file,
                  line: line
        )
    }
    
    func waitExist(timeout: TimeInterval = 5,
                   file: StaticString = #file,
                   line: UInt = #line
 ) {
        let result = waitForExistence(timeout: 5)
        XCTAssert(result,
                  "Элемент отсутствует в иерархии элементов",
                  file: file,
                  line: line
        )
    }
}
