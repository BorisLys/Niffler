import XCTest
import NifflerApp

final class LoginPage: BasePage, NavigationBar {
    
    typealias IDs = LoginViewIDs
    
    // MARK: - Locators
    
    private var logInText: XCUIElement {
        app.staticTexts[IDs.logInText.rawValue]
    }
    
    private var userNameTextField: XCUIElement {
        app.textFields[IDs.userNameTextField.rawValue]
    }
    
    private var passwordTextField: XCUIElement {
        app.secureTextFields[IDs.passwordTextField.rawValue]
    }
    
    private var loginButton: XCUIElement {
        app.buttons[IDs.loginButton.rawValue]
    }
    
    private var loginErrorText: XCUIElement {
        app.staticTexts[IDs.loginError.rawValue]
    }
    
    // MARK: - Action
    
    @discardableResult
    func inputLogin(_ login: String) -> Self {
        XCTContext.runActivity(named: "Вводим логин \(login)") { _ in
            userNameTextField.tapElement()
            userNameTextField.typeText(login)
        }
        return self
    }
    
    @discardableResult
    func inputPassword(_ password: String) -> Self {
        XCTContext.runActivity(named: "Вводим пароль \(password)") { activity in
            passwordTextField.tapElement()
            passwordTextField.typeText(password)
            
            // Добавляем в отчет скриншот элемента
            let image = passwordTextField.screenshot()
            let attachment = XCTAttachment(screenshot: image)
            activity.add(attachment)
        }

        return self
    }
    
    @discardableResult
    func tapLoginButton() -> Self {
        XCTContext.runActivity(named: "Нажимае кнопку логин") { activity in
            loginButton.tapElement()
            let jsonObject: [String: Any] = [
                 "status": "success",
                 "message": "Test completed",
                 "data": [
                     "id": 123,
                     "name": "Test User"
                 ]
             ]
            
            guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                XCTFail("Не удалось создать JSON")
                return
            }
            
            let attachment = XCTAttachment(data: jsonData, uniformTypeIdentifier: "public.json")
            attachment.name = "TestResult.json"
            attachment.lifetime = .keepAlways // Храним даже при успешном тесте
            
            activity.add(attachment)
        }
        return self
    }
    
    // MARK: - Verify
    
    @discardableResult
    func verifyLoginError(_ text: String) -> Self {
        XCTContext.runActivity(named: "Проверяем текст ошибки: \(text)") { activity in
            loginErrorText.verifyLabel(equal: text)
        }
        return self
    }
}
