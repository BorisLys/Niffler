import XCTest

class BaseTest: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        
        // Аргументы запуска
        app.launchArguments.append("RemoveAuthOnStart")
        app.launchEnvironment["host"] = "https://test.com"

        app.launch()
    }
    
    override func tearDown() {
        app = nil
        
        pages = nil
        factory = nil
        
        super.tearDown()
    }
    
    lazy var pages: PageFactory! = PageFactory(app: app)
    lazy var factory: PageObjectsFactory! = PageObjectsFactory(app: app)
}

