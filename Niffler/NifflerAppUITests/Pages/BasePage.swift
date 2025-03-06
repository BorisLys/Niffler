import XCTest

class BasePage {
    required init(app: XCUIApplication) {
        self.app = app
    }
    
    let app: XCUIApplication
}
