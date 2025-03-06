//
//  LogInTest.swift
//  NifflerUITests
//
//  Created by Борис Лысиков on 01.03.2025.
//

import XCTest

final class LogInTest: BaseTest {
    
    func testLoginSuccess() {
//        pages.loginPage()
//            .inputLogin("stage")
//            .inputPassword("12345")
//            .tapLoginButton()
//        pages.statisticPage()
//            .verifyStatisticText("Statistics")
        
        factory.create(LoginPage.self)
            .inputLogin("stage")
            .inputPassword("12345")
            .tapLoginButton()
        factory.create(StatisticPage.self)
            .verifyStatisticText("Statisticsd")
    }
    
    
    func testLoginFailure() throws {
        
        let errorMessage = "Нет такого пользователя. Попробуйте другие данные"
        
        pages.loginPage()
            .inputLogin("stage")
            .inputPassword("123456")
            .tapLoginButton()
            .verifyLoginError(errorMessage)
    }
    
    func testSkip() throws {
        let systemVersion = ProcessInfo.processInfo.operatingSystemVersion
        let isOlderThanIOS16 = systemVersion.majorVersion < 19
        
        try XCTSkipIf(isOlderThanIOS16, "Тест пропускается, так как требуется iOS 19+")
    }
    
    func testExpectedFailure() throws {
        XCTExpectFailure("Известный баг: ссылка на баг трекер")
        
        let result = 2 + 3  // Ожидаем 4, но баг возвращает 5
        XCTAssertEqual(result, 4)
    }
}
