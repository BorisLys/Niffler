import XCTest
import Niffler

final class LoginPage: BasePage {
    
    typealias IDs = LoginViewIDs
    
    // вычисляется один раз при первом доступе и затем хранит ссылку.
    private lazy var logInText2 = app.staticTexts[IDs.logInText.rawValue]
    
    // computed property — вычисляется каждый раз при обращении.
    private var logInText: XCUIElement {
        app.staticTexts[IDs.logInText.rawValue]
    }
    
    private var userNameTextField: XCUIElement {
        app.textFields[IDs.userNameTextField.rawValue]
    }
    
    private var passwordTextFiel: XCUIElement {
        app.textFields[IDs.passwordTextField.rawValue]
    }
    
    @discardableResult
    func input(login: String, password: String) -> Self {
        XCTContext.runActivity(named: "Авторизуюсь \(login), \(password)") { _ in
            input(login: login)
            input(password: password)
            pressLoginButton()
        }
        return self
    }
    
    private func input(login: String) {
        XCTContext.runActivity(named: "Ввожу логин \(login)") { _ in
            app.textFields["userNameTextField"].tap()
            app.textFields["userNameTextField"].tap() // TODO: Remove the cause of double tap
            app.textFields["userNameTextField"].typeText(login)
        }
    }
    
    private func input(password: String) {
        XCTContext.runActivity(named: "Ввожу пароль \(password)") { _ in
            app.secureTextFields["passwordTextField"].tap()
            app.secureTextFields["passwordTextField"].typeText(password)
        }
    }
    
    private func pressLoginButton() {
        XCTContext.runActivity(named: "Жму кнопку логина") { _ in
            app.buttons["loginButton"].tap()
        }
    }
    
    func assertIsLoginErrorShown(file: StaticString = #filePath, line: UInt = #line) {
        XCTContext.runActivity(named: "Жду сообщение с ошибкой") { _ in
            let isFound = app.staticTexts["LoginError"]
                .waitForExistence(timeout: 5)
            
            XCTAssertTrue(isFound,
                          "Не нашли сообщение о неправильном логине",
                          file: file, line: line)
        }
    }
    
    func assertNoErrorShown(file: StaticString = #filePath, line: UInt = #line) {
        XCTContext.runActivity(named: "Жду сообщение с ошибкой") { _ in
            let errorLabel =
             app.staticTexts[
                "LoginError"
                //"Нет такого пользователя. Попробуйте другие данные"
            ]
                
            let isFound = errorLabel.waitForExistence(timeout: 5)
            
            XCTAssertFalse(isFound,
                           "Появилась ошибка: \(errorLabel.label)",
                          file: file, line: line)
        }
    }
}
